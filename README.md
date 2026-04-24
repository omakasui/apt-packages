# apt-packages

APT repository for [omakasui](https://omakasui.org), served via GitHub Pages at `packages.omakasui.org`.

Metadata (`dists/`) and the package index (`index/packages.tsv`) live in this repo. Binary packages are stored as GitHub Release assets in [build-apt-packages](https://github.com/omakasui/build-apt-packages) and referenced directly via their full URL in the `Filename` field of the `Packages` index. No proxy or redirect layer required.

## Suites and architectures

| Suite | Distro | Architectures |
|---|---|---|
| `noble` | Ubuntu 24.04 | `amd64`, `arm64` |
| `noble-dev` | Ubuntu 24.04 (dev channel) | `amd64`, `arm64` |
| `trixie` | Debian 13 | `amd64`, `arm64` |
| `trixie-dev` | Debian 13 (dev channel) | `amd64`, `arm64` |

Dev suites include all stable packages as a base; dev-channel entries take precedence when present.

## Packages

| Package | Upstream | Suites | Architectures |
|---|---|---|---|
| `aether` | [aether](https://github.com/bjarneo/aether) | noble, trixie | amd64, arm64 |
| `alacritty` | [alacritty](https://github.com/alacritty/alacritty) | noble, trixie | amd64, arm64 |
| `asdcontrol` | [asdcontrol](https://github.com/omakasui/asdcontrol) | noble, trixie | amd64, arm64 |
| `bluetui` | [bluetui](https://github.com/pythops/bluetui) | noble, trixie | amd64, arm64 |
| `btop` | [btop](https://github.com/aristocratos/btop) | noble, trixie | amd64, arm64 |
| `cliamp` | [cliamp](https://github.com/bjarneo/cliamp) | noble, trixie | amd64, arm64 |
| `dbeaver-ce` | [dbeaver](https://github.com/dbeaver/dbeaver) | noble, trixie | amd64, arm64 |
| `elephant` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-1password` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-bitwarden` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-bluetooth` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-bookmarks` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-calc` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-clipboard` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-desktopapplications` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-files` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-menus` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-niriactions` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-nirisessions` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-playerctl` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-providerlist` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-runner` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-snippets` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-symbols` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-todo` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-unicode` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-websearch` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-windows` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-wireplumber` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `eza` | [eza](https://github.com/eza-community/eza) | noble, trixie | amd64, arm64 |
| `fastfetch` | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | noble, trixie | amd64, arm64 |
| `fonts-cascadia-mono-nf` | [Cascadia Code](https://github.com/ryanoasis/nerd-fonts) | noble, trixie | all |
| `fonts-ia-writer-mono` | [iA Writer Mono](https://github.com/iaolo/iA-Fonts) | noble, trixie | all |
| `fonts-jetbrains-mono` | [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) | noble, trixie | all |
| `fzf` | [fzf](https://github.com/junegunn/fzf) | noble, trixie | amd64, arm64 |
| `ghostty` | [ghostty](https://github.com/ghostty-org/ghostty) | noble, trixie | amd64, arm64 |
| `glab` | [glab](https://gitlab.com/gitlab-org/cli) | noble, trixie | amd64, arm64 |
| `gum` | [gum](https://github.com/charmbracelet/gum) | noble, trixie | amd64, arm64 |
| `impala` | [impala](https://github.com/pythops/impala) | noble, trixie | amd64, arm64 |
| `kitty` | [kitty](https://sw.kovidgoyal.net/kitty/) | noble, trixie | amd64, arm64 |
| `lazydocker` | [lazydocker](https://github.com/jesseduffield/lazydocker) | noble, trixie | amd64, arm64 |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) | noble, trixie | amd64, arm64 |
| `libgtk4-layer-shell0` | [gtk4-layer-shell](https://github.com/wmww/gtk4-layer-shell) | noble, trixie | amd64, arm64 |
| `localsend` | [localsend](https://github.com/localsend/localsend) | noble, trixie | amd64, arm64 |
| `nautilus-open-any-terminal` | [nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal) | noble, trixie | all |
| `niri` | [Niri](https://github.com/niri-wm/niri) | noble, trixie | amd64, arm64 |
| `nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | amd64, arm64 |
| `omakasui-aether` | [aether](https://github.com/bjarneo/aether) | noble, trixie | all |
| `omakasui-nvim` | [LazyVim](https://github.com/LazyVim/LazyVim) | noble, trixie | all |
| `omakasui-walker` | [walker](https://github.com/abenz1267/walker) | noble, trixie | all |
| `omakasui-zellij` | [zellij](https://github.com/zellij-org/zellij) | noble, trixie | all |
| `pinta` | [Pinta](https://github.com/PintaProject/Pinta) | noble, trixie | amd64, arm64 |
| `starship` | [starship](https://starship.rs) | noble, trixie | amd64, arm64 |
| `swaybg` | [swaybg](https://github.com/swaywm/swaybg) | noble, trixie | amd64, arm64 |
| `tmux` | [tmux](https://github.com/tmux/tmux) | noble, trixie | amd64, arm64 |
| `ufw-docker` | [ufw-docker](https://github.com/chaifeng/ufw-docker) | noble, trixie | amd64, arm64 |
| `uwsm` | [uwsm](https://github.com/Vladimir-csp/uwsm) | trixie | all |
| `walker` | [walker](https://github.com/abenz1267/walker) | noble, trixie | amd64, arm64 |
| `waybar` | [Waybar](https://github.com/Alexays/Waybar) | noble, trixie | amd64, arm64 |
| `wiremix` | [wiremix](https://github.com/tsowell/wiremix) | noble, trixie | amd64, arm64 |
| `xdg-terminal-exec` | [xdg-terminal-exec](https://github.com/Vladimir-csp/xdg-terminal-exec) | noble, trixie | amd64, arm64 |
| `yaru-theme-gnome-shell` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-gtk` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-icon` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yaru-theme-sound` | [Yaru](https://github.com/ubuntu/yaru) | trixie | all |
| `yazi` | [yazi](https://github.com/sxyazi/yazi) | noble, trixie | amd64, arm64 |
| `zellij` | [zellij](https://github.com/zellij-org/zellij) | noble, trixie | amd64, arm64 |
| `zen-browser` | [zen-browser](https://zen-browser.app/) | noble, trixie | amd64, arm64 |
| `zoxide` | [zoxide](https://github.com/ajeetdsouza/zoxide) | noble, trixie | amd64, arm64 |

`omakasui-aether` is used to make it easier to setup aether on Omakasui setups. You can download both the "basic" version and the ones intended for the Omakasui distros: `omakub-aether` ([Omabuntu](https://omabuntu.omakasui.org)/[Omakub](https://omakub.org)) and `omadeb-aether` ([Omadeb](https://omadeb.omakasui.org)).

`omakasui-walker` is a metapackage that installs `walker`, `elephant`, and all elephant provider packages in one shot. You can download both the "basic" version and the ones intended for the Omakasui distros: `omakub-walker` ([Omabuntu](https://omabuntu.omakasui.org)/[Omakub](https://omakub.org)) and `omadeb-walker` ([Omadeb](https://omadeb.omakasui.org)).

`omakasui-zellij` is a custom configuration of Zellij, based on the one made by [Omakub](https://omakub.org). You can download both the "basic" version and the ones intended for the Omakasui distros: `omakub-zellij` ([Omabuntu](https://omabuntu.omakasui.org)/[Omakub](https://omakub.org)) and `omadeb-zellij` ([Omadeb](https://omadeb.omakasui.org)).

`omakasui-nvim` is a custom configuration of LazyVim, based on the one made by [Omarchy](https://omarchy.org). You can download both the "basic" version and the ones intended for the Omakasui distros: `omakub-nvim` ([Omabuntu](https://omabuntu.omakasui.org)/[Omakub](https://omakub.org)) and `omadeb-nvim` ([Omadeb](https://omadeb.omakasui.org)).

## Copyright and licensing

The packages distributed through this repository are **third-party software**. Each package remains the property of its respective upstream author(s) and is subject to its own license.

This repository does not claim any ownership over the upstream software. Its sole purpose is to make installation easier on systems running Omakasui by providing pre-built `.deb` packages. All trademarks, copyrights, and licenses belong to their respective holders as listed in the upstream column of the packages table above.

If you are an upstream maintainer and have concerns about the distribution of your software here, please open an issue or contact the omakasui project directly.

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
