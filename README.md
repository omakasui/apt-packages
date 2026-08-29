# apt-packages

APT repository for [omakasui](https://omakasui.org), served via GitHub Pages at `packages.omakasui.org`.

Metadata (`dists/`) and the package index (`index/packages.tsv`) live in this repo. Binary packages are stored as GitHub Release assets in [build-apt-packages](https://github.com/omakasui/build-apt-packages) and referenced via pool-relative paths in the `Filename` field of the `Packages` index. A Cloudflare Worker on `packages.omakasui.org` redirects `/pool/` requests to those release assets. No binaries are stored in this repo.

## Suites and architectures

| Suite | Distro | Architectures |
|---|---|---|
| `noble` | Ubuntu 24.04 | `amd64`, `arm64` |
| `noble-dev` | Ubuntu 24.04 (dev channel) | `amd64`, `arm64` |
| `resolute` | Ubuntu 26.04 | `amd64`, `arm64` |
| `resolute-dev` | Ubuntu 26.04 (dev channel) | `amd64`, `arm64` |
| `trixie` | Debian 13 | `amd64`, `arm64` |
| `trixie-dev` | Debian 13 (dev channel) | `amd64`, `arm64` |

Dev suites include all stable packages as a base; dev-channel entries take precedence when present.

## Packages

| Package | Upstream | Suites | Architectures |
|---|---|---|---|
| `alacritty` | [alacritty](https://github.com/alacritty/alacritty) | all | all |
| `asdcontrol` | [asdcontrol](https://github.com/omakasui/asdcontrol) | all | all |
| `bitwarden` | [bitwarden](https://bitwarden.com) | all | amd64 |
| `bitwarden-cli` | [bitwarden-cli](https://bitwarden.com/help/cli/) | all | all |
| `btop` | [btop](https://github.com/aristocratos/btop) | all | all |
| `cliamp` | [cliamp](https://github.com/bjarneo/cliamp) | all | all |
| `dbeaver-ce` | [dbeaver](https://github.com/dbeaver/dbeaver) | all | all |
| `elephant` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-1password` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-all` | [elephant-all](https://github.com/abenz1267/elephant) | all | all |
| `elephant-bitwarden` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-bluetooth` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-bookmarks` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-calc` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-clipboard` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-desktopapplications` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-files` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-menus` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-niriactions` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-nirisessions` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-playerctl` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-providerlist` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-runner` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-snippets` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-symbols` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-todo` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-unicode` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-websearch` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-windows` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `elephant-wireplumber` | [elephant](https://github.com/abenz1267/elephant) | all | all |
| `eza` | [eza](https://github.com/eza-community/eza) | all | all |
| `fastfetch` | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | all | all |
| `fonts-cascadia-mono-nf` | [Cascadia Code](https://github.com/ryanoasis/nerd-fonts) | all | all |
| `fonts-ia-writer-mono` | [iA Writer Mono](https://github.com/iaolo/iA-Fonts) | all | all |
| `fonts-jetbrains-mono` | [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) | all | all |
| `fzf` | [fzf](https://github.com/junegunn/fzf) | all | all |
| `gh` | [gh](https://github.com/cli/cli) | all | all |
| `ghostty` | [ghostty](https://github.com/ghostty-org/ghostty) | all | all |
| `glab` | [glab](https://gitlab.com/gitlab-org/cli) | all | all |
| `gum` | [gum](https://github.com/charmbracelet/gum) | all | all |
| `kitty` | [kitty](https://sw.kovidgoyal.net/kitty/) | all | all |
| `lazydocker` | [lazydocker](https://github.com/jesseduffield/lazydocker) | all | all |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) | all | all |
| `libgtk4-layer-shell0` | [gtk4-layer-shell](https://github.com/wmww/gtk4-layer-shell) | all | all |
| `localsend` | [localsend](https://github.com/localsend/localsend) | all | all |
| `nautilus-open-any-terminal` | [nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal) | all | all |
| `niri` | [niri](https://github.com/niri-wm/niri) | all | all |
| `nvim` | [Neovim](https://github.com/neovim/neovim) | all | all |
| `obsidian` | [Obsidian](https://github.com/obsidianmd/obsidian-releases) | all | all |
| `opencode` | [opencode](https://github.com/anomalyco/opencode) | all | all |
| `pinta` | [Pinta](https://github.com/PintaProject/Pinta) | all | all |
| `python3-terminaltexteffects` | [terminaltexteffects](https://github.com/ChrisBuilds/terminaltexteffects) | all | all |
| `starship` | [starship](https://starship.rs) | all | all |
| `tmux` | [tmux](https://github.com/tmux/tmux) | all | all |
| `ufw-docker` | [ufw-docker](https://github.com/chaifeng/ufw-docker) | all | all |
| `walker` | [walker](https://github.com/abenz1267/walker) | all | all |
| `xdg-terminal-exec` | [xdg-terminal-exec](https://github.com/Vladimir-csp/xdg-terminal-exec) | all | all |
| `xwayland-satellite` | [xwayland-satellite](https://github.com/Supreeeme/xwayland-satellite) | all | all |
| `yaru-theme-gnome-shell` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-gtk` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-icon` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-sound` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `zed` | [zed](https://zed.dev) | all | all |
| `zellij` | [zellij](https://github.com/zellij-org/zellij) | all | all |
| `zen-browser` | [zen-browser](https://zen-browser.app/) | all | all |
| `zoxide` | [zoxide](https://github.com/ajeetdsouza/zoxide) | all | all |

## Copyright and licensing

The packages distributed through this repository are **third-party software**. Each package remains the property of its respective upstream author(s) and is subject to its own license.

This repository does not claim any ownership over the upstream software. Its sole purpose is to make installation easier on systems running Omakasui by providing pre-built `.deb` packages. All trademarks, copyrights, and licenses belong to their respective holders as listed in the upstream column of the packages table above.

If you are an upstream maintainer and have concerns about the distribution of your software here, please open an issue or contact the omakasui project directly.

## Scripts and local workflow

Run `make help` from the repo root for a full list of available targets. Common ones:

```bash
make list                                          # show all packages in the index
make list-dev                                      # show packages not yet promoted to stable
make info PKG=fzf                                  # inspect all entries for a package
make check                                         # count entries per suite/arch
make index                                         # regenerate Packages files
make rebuild GPG_KEY_ID=<fp>                       # regenerate + re-sign
make promote-pkg PKG=fzf                           # promote fzf dev → stable
make readme                                        # sync the README packages table
make prune-dry                                     # preview stale releases in build-apt-packages
```

## packages.tsv format

```
<suite> <arch> <name> <version> <url> <size> <md5> <sha1> <sha256> <control_b64> [<channel>]
```

`url` is the full GitHub Releases asset URL, stored as source of truth. When generating the `Packages` index, `update-index.sh` converts it to a pool-relative path (`pool/<tag>/<file>`). The Cloudflare Worker on `packages.omakasui.org` redirects `pool/` requests to the corresponding GitHub Releases asset — no binaries are stored in this repo.

The `channel` field is `stable` (default) or `dev`. Pass `--channel dev` to `register-package.sh` to publish to the dev channel, which populates the `*-dev` suites.

## User setup

```bash
curl -fsSL https://keyrings.omakasui.org/omakasui-packages.gpg.key \
  | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/omakasui-packages.gpg

echo "deb [signed-by=/etc/apt/trusted.gpg.d/omakasui-packages.gpg] \
  https://packages.omakasui.org $(. /etc/os-release && echo $VERSION_CODENAME) main" \
  | sudo tee /etc/apt/sources.list.d/omakasui.list

sudo apt-get update
```
