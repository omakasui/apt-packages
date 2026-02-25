# omakasui/apt-packages

Custom APT repository for Ubuntu 24.04 (noble) and Debian 13 (trixie).
Packages are built by [omakasui/build-packages](https://github.com/omakasui/build-packages)
and published here automatically via CI.

## Installation

```bash
# Import GPG signing key
curl -fsSL https://packages.omakasui.org/omakasui.gpg.key \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/omakasui-apt.gpg > /dev/null

# Add APT source
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/omakasui-apt.gpg] \
  https://packages.omakasui.org $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") main" \
  | sudo tee /etc/apt/sources.list.d/omakasui.list

# Update package lists
sudo apt update

# Install package
sudo apt install package
```

## Repository structure

```
apt-pkg/
├── omakasui.gpg.key          ← public GPG key
├── dists/trixie/
│   ├── Release
│   ├── Release.gpg
│   ├── InRelease
│   └── main/binary-{amd64,arm64}/Packages(.gz/.xz)
├── dists/noble/
│   ├── Release
│   ├── Release.gpg
│   ├── InRelease
│   └── main/binary-{amd64,arm64}/Packages(.gz/.xz)
├── pool/trixie/
│   ├── amd64/*.deb           ← binaries committed to Git
│   └── arm64/*.deb
└── pool/noble/
    ├── amd64/*.deb           ← binaries committed to Git
    └── arm64/*.deb
```

Note: `.deb` files are committed to Git so GitHub Pages can serve them directly.

## Supported distributions

| Distribution     | Codename |
|------------------|----------|
| Ubuntu 24.04 LTS | noble    |
| Debian 13        | trixie   |

## Available packages

| Package | Version | Distros         | Architectures |
|---------|---------|-----------------|---------------|
