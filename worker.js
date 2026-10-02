/**
 * Cloudflare Worker — pool redirect for packages.omakasui.org
 *
 * apt always treats the Filename field in a Packages index as a path relative
 * to the repository base URL.  Binary packages live as release assets in
 * omakasui/build-apt-packages, so we need a redirect layer instead of storing
 * .deb files in this repository.
 *
 * Filename written to Packages:  pool/<tag>/<file>
 * Worker redirects:               /pool/<tag>/<file>
 *   → https://github.com/omakasui/build-apt-packages/releases/download/<tag>/<file>
 *
 * apt follows HTTP 302 redirects, so the download ends up at the GitHub CDN
 * without any binary ever being committed to this repo.
 *
 * /omakasui-archive-keyring/<suite>.deb is a stable bootstrap URL: it reads the
 * suite's Packages index and redirects to the current keyring release asset.
 *
 * Every other request is passed through to GitHub Pages unchanged.
 */

const BUILD_REPO = "omakasui/build-apt-packages";
const KEYRING = "omakasui-archive-keyring";

// Resolve the pool path of `pkg` from a Packages index, or null.
async function poolPath(origin, index, pkg) {
  const res = await fetch(`${origin}${index}`, { cf: { cacheTtl: 300 } });
  if (!res.ok) return null;
  const stanza = (await res.text())
    .split("\n\n")
    .find((s) => s.startsWith(`Package: ${pkg}\n`));
  return stanza?.match(/^Filename: (pool\/[^\n]+)$/m)?.[1] ?? null;
}

export default {
  async fetch(request) {
    const url = new URL(request.url);
    const isRead = request.method === "GET" || request.method === "HEAD";

    // /omakasui-archive-keyring/<suite>.deb → latest keyring for that suite
    const keyring = url.pathname.match(new RegExp(`^/${KEYRING}/([a-z]+)\\.deb$`));
    if (isRead && keyring) {
      const path = await poolPath(
        url.origin, `/dists/${keyring[1]}/main/binary-amd64/Packages`, KEYRING);
      if (!path) return new Response("Not found\n", { status: 404 });
      url.pathname = `/${path}`;
    }

    // Only intercept GET/HEAD requests to /pool/<tag>/<filename>
    if (isRead && url.pathname.startsWith("/pool/")) {
      const parts = url.pathname.split("/").filter(Boolean);
      // Expect exactly: ['pool', '<tag>', '<filename>']
      if (parts.length === 3) {
        const [, tag, filename] = parts;
        const target = `https://github.com/${BUILD_REPO}/releases/download/${tag}/${filename}`;
        return Response.redirect(target, 302);
      }
    }

    // Pass everything else through to GitHub Pages.
    return fetch(request);
  },
};
