# apt-packages

APT repository for [omakasui](https://omakasui.org), served via GitHub Pages at `packages.omakasui.org`.

Metadata (`dists/`) and the package index (`index/packages.tsv`) live in this repo. Binary packages are stored as GitHub Release assets in [build-apt-packages](https://github.com/omakasui/build-apt-packages). The `Filename` field in the `Packages` index uses a pool-relative path (`pool/<tag>/<file>`), and a Cloudflare Worker on `packages.omakasui.org` redirects those requests to the corresponding GitHub Releases asset.


## packages.tsv format

```
<suite> <arch> <name> <version> <url> <size> <md5> <sha1> <sha256>
```

`url` is the full GitHub Releases asset URL, stored as the source of truth. When generating the `Packages` index, `update-index.sh` converts it to a pool-relative path (`pool/<tag>/<file>`). The Cloudflare Worker redirects `pool/` requests to GitHub Releases — `apt` follows the 302 and downloads from GitHub's CDN.

## User setup

```bash
curl -fsSL https://keyrings.omakasui.org/omakasui-packages.gpg \
  | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/omakasui-packages.gpg

echo "deb [signed-by=/etc/apt/trusted.gpg.d/omakasui-packages.gpg] \
  https://packages.omakasui.org $(. /etc/os-release && echo $VERSION_CODENAME) main" \
  | sudo tee /etc/apt/sources.list.d/omakasui.list

sudo apt-get update
```

Or use the install script:

```bash
curl -fsSL https://packages.omakasui.org/install.sh | bash
```