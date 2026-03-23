# apt-packages

APT repository for [omakasui](https://omakasui.org), served via GitHub Pages at `packages.omakasui.org`.

Metadata (`dists/`) and the package index (`index/packages.tsv`) live in this repo. Binary packages are stored as GitHub Release assets in [build-apt-packages](https://github.com/omakasui/build-apt-packages) and referenced directly via their full URL in the `Filename` field of the `Packages` index. No proxy or redirect layer required.

## Suites and architectures

| Suite | Distro | Architectures |
|---|---|---|
| `noble` | Ubuntu 24.04 | `amd64`, `arm64` |
| `trixie` | Debian 13 | `amd64`, `arm64` |

## Packages

| Package | Upstream | Suites | Architectures |
|---|---|---|---|
| `aether` | [aether](https://github.com/bjarneo/aether) | noble, trixie | amd64, arm64 |
| `alacritty` | [alacritty](https://github.com/alacritty/alacritty) | noble, trixie | amd64, arm64 |
| `elephant` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | amd64, arm64 |
| `elephant-calc` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-clipboard` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-desktopapplications` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-files` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-menus` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-providerlist` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-runner` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-symbols` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-todo` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-unicode` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `elephant-websearch` | [elephant](https://github.com/abenz1267/elephant) | noble, trixie | all |
| `fastfetch` | [fastfetch](https://github.com/fastfetch-cli/fastfetch) | noble, trixie | amd64, arm64 |
| `font-cascadia-mono-nf` | [Cascadia Code](https://github.com/ryanoasis/nerd-fonts) | noble, trixie | all |
| `font-ia-writer-mono` | [iA Writer Mono](https://github.com/iaolo/iA-Fonts) | noble, trixie | all |
| `font-jetbrains-mono` | [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) | noble, trixie | all |
| `glab` | [glab](https://gitlab.com/gitlab-org/cli) | noble, trixie | amd64, arm64 |
| `ghostty` | [ghostty](https://github.com/ghostty-org/ghostty) | noble, trixie | amd64, arm64 |
| `gum` | [gum](https://github.com/charmbracelet/gum) | noble, trixie | amd64, arm64 |
| `kitty` | [kitty](https://sw.kovidgoyal.net/kitty/) | noble, trixie | amd64, arm64 |
| `lazydocker` | [lazydocker](https://github.com/jesseduffield/lazydocker) | noble, trixie | amd64, arm64 |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) | noble, trixie | amd64, arm64 |
| `makima` | [makima](https://github.com/cyber-sushi/makima) | noble, trixie | amd64, arm64 |
| `nautilus-open-any-terminal` | [nautilus-open-any-terminal](https://github.com/Stunkymonkey/nautilus-open-any-terminal) | noble, trixie | all |
| `nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | all |
| `omakasui-nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | all |
| `omakub-nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | all |
| `omadeb-nvim` | [Neovim](https://github.com/neovim/neovim) | noble, trixie | all |
| `omakasui-walker` | [walker](https://github.com/abenz1267/walker) | noble, trixie | all |
| `gtk4-layer-shell` | [gtk4-layer-shell](https://github.com/wmww/gtk4-layer-shell) | noble, trixie | amd64, arm64 |
| `ufw-docker` | [ufw-docker](https://github.com/chaifeng/ufw-docker) | noble, trixie | all |
| `uwsm` | [uwsm](https://github.com/Vladimir-csp/uwsm) | noble, trixie | amd64, arm64 |
| `walker` | [walker](https://github.com/abenz1267/walker) | noble, trixie | amd64, arm64 |
| `yaru-theme` | [Yaru](https://github.com/ubuntu/yaru) | noble, trixie | all |
| `zellij` | [zellij](https://github.com/zellij-org/zellij) | noble, trixie | amd64, arm64 |

`omakasui-walker` is a metapackage that installs `walker`, `elephant`, and all elephant provider packages in one shot.

`omakasui-nvim` is a custom configuration of LazyVim, based on the one made by [Omarchy](https://omarchy.org). You can download both the "basic" version and the ones intended for the Omakasui distros: `omakub-nvim` ([Omabuntu](https://omabuntu.omakasui.org)/[Omakub](https://omakub.org)) and `omadeb-nvim` ([Omadeb](https://omadeb.omakasui.org)).

## Copyright and licensing

The packages distributed through this repository are **third-party software**. Each package remains the property of its respective upstream author(s) and is subject to its own license.

This repository does not claim any ownership over the upstream software. Its sole purpose is to make installation easier on systems running Omakasui by providing pre-built `.deb` packages. All trademarks, copyrights, and licenses belong to their respective holders as listed in the upstream column of the packages table above.

If you are an upstream maintainer and have concerns about the distribution of your software here, please open an issue or contact the omakasui project directly.

## packages.tsv format

```
<suite> <arch> <name> <version> <url> <size> <md5> <sha1> <sha256> <control_b64>
```

`url` is the full GitHub Releases asset URL, stored as source of truth. When generating the `Packages` index, `update-index.sh` converts it to a pool-relative path (`pool/<tag>/<file>`). The Cloudflare Worker on `packages.omakasui.org` redirects `pool/` requests to the corresponding GitHub Releases asset — no binaries are stored in this repo.

## User setup

```bash
curl -fsSL https://keyrings.omakasui.org/omakasui-packages.gpg \
  | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/omakasui-packages.gpg

echo "deb [signed-by=/etc/apt/trusted.gpg.d/omakasui-packages.gpg] \
  https://packages.omakasui.org $(. /etc/os-release && echo $VERSION_CODENAME) main" \
  | sudo tee /etc/apt/sources.list.d/omakasui.list

sudo apt-get update
```
