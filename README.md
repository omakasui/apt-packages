# apt-packages

APT repository for [omakasui](https://omakasui.org), served via GitHub Pages at `packages.omakasui.org`.

Metadata (`dists/`) and the package index (`index/packages.tsv`) live in this repo. Binary packages are stored as GitHub Release assets in [build-apt-packages](https://github.com/omakasui/build-apt-packages) and referenced directly via their full URL in the `Filename` field of the `Packages` index. No proxy or redirect layer required.

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
| `aether` | [aether](https://github.com/bjarneo/aether) | noble, trixie | all |
| `alacritty` | [alacritty](https://github.com/alacritty/alacritty) | noble, trixie | all |
| `asdcontrol` | [asdcontrol](https://github.com/omakasui/asdcontrol) | noble, trixie | all |
| `bitwarden` | [bitwarden](https://bitwarden.com) | all | amd64 |
| `bitwarden-cli` | [bitwarden-cli](https://bitwarden.com/help/cli/) | noble, trixie | all |
| `bluetui` | [bluetui](https://github.com/pythops/bluetui) | noble, trixie | all |
| `btop` | [btop](https://github.com/aristocratos/btop) | noble, trixie | all |
| `cliamp` | [cliamp](https://github.com/bjarneo/cliamp) | noble, trixie | all |
| `dbeaver` | [dbeaver](https://dbeaver.io/) | noble, trixie | all |
| `dbeaver-ce` | [dbeaver](https://github.com/dbeaver/dbeaver) | all | all |
| `elephant` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-1password` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-all` | [elephant-all](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-bitwarden` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-bluetooth` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-bookmarks` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-calc` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-clipboard` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-desktopapplications` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-files` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-menus` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-niriactions` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-nirisessions` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-playerctl` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-providerlist` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-runner` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-snippets` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-symbols` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-todo` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-unicode` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-websearch` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-windows` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-wireplumber` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `eza` | [eza](https://github.com/eza-community/eza) | noble, trixie | all |
| `fastfetch` | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | noble, trixie | all |
| `font-cascadia-mono-nf` | [font-cascadia-mono-nf](https://github.com/ryanoasis/nerd-fonts) | noble, trixie | all |
| `font-ia-writer-mono` | [font-ia-writer-mono](https://github.com/iaolo/iA-Fonts) | noble, trixie | all |
| `font-jetbrains-mono` | [font-jetbrains-mono](https://www.jetbrains.com/lp/mono/) | noble, trixie | all |
| `fonts-cascadia-mono-nf` | [Cascadia Code](https://github.com/ryanoasis/nerd-fonts) | noble, trixie | all |
| `fonts-ia-writer-mono` | [iA Writer Mono](https://github.com/iaolo/iA-Fonts) | noble, trixie | all |
| `fonts-jetbrains-mono` | [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) | noble, trixie | all |
| `fzf` | [fzf](https://github.com/junegunn/fzf) | noble, trixie | all |
| `ghostty` | [ghostty](https://github.com/ghostty-org/ghostty) | noble, trixie | all |
| `glab` | [glab](https://gitlab.com/gitlab-org/cli) | noble, trixie | all |
| `gum` | [gum](https://github.com/charmbracelet/gum) | noble, trixie | all |
| `impala` | [impala](https://github.com/pythops/impala) | noble, trixie | all |
| `kitty` | [kitty](https://sw.kovidgoyal.net/kitty/) | noble, trixie | all |
| `lazydocker` | [lazydocker](https://github.com/jesseduffield/lazydocker) | noble, trixie | all |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) | noble, trixie | all |
| `libgtk4-layer-shell-0` | [libgtk4-layer-shell-0](https://github.com/wmww/gtk4-layer-shell) | noble, trixie | all |
| `libgtk4-layer-shell0` | [gtk4-layer-shell](https://github.com/wmww/gtk4-layer-shell) | noble, trixie | all |
| `localsend` | [localsend](https://github.com/localsend/localsend) | noble, trixie | all |
| `nautilus-open-any-terminal` | [nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal) | noble, trixie | all |
| `niri` | [Niri](https://github.com/niri-wm/niri) | noble, trixie | all |
| `nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | all |
| `pinta` | [Pinta](https://github.com/PintaProject/Pinta) | noble, trixie | all |
| `starship` | [starship](https://starship.rs) | noble, trixie | all |
| `swaybg` | [swaybg](https://github.com/swaywm/swaybg) | noble, trixie | all |
| `tmux` | [tmux](https://github.com/tmux/tmux) | noble, trixie | all |
| `ufw-docker` | [ufw-docker](https://github.com/chaifeng/ufw-docker) | noble, trixie | all |
| `uwsm` | [uwsm](https://github.com/Vladimir-csp/uwsm) | trixie | all |
| `walker` | [walker](https://github.com/abenz1267/walker) | noble, trixie | all |
| `waybar` | [Waybar](https://github.com/Alexays/Waybar) | noble, trixie | all |
| `wiremix` | [wiremix](https://github.com/tsowell/wiremix) | noble, trixie | all |
| `xdg-terminal-exec` | [xdg-terminal-exec](https://github.com/Vladimir-csp/xdg-terminal-exec) | noble, trixie | all |
| `yaru-theme-gnome-shell` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-gtk` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-icon` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-sound` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yazi` | [yazi](https://github.com/sxyazi/yazi) | noble, trixie | all |
| `zed` | [zed](https://zed.dev) | all | all |
| `zellij` | [zellij](https://github.com/zellij-org/zellij) | noble, trixie | all |
| `zen-browser` | [zen-browser](https://zen-browser.app/) | all | all |
| `zoxide` | [zoxide](https://github.com/ajeetdsouza/zoxide) | noble, trixie | all |

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
