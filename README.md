# omakasui/apt-packages

Custom APT repository for Ubuntu 24.04 (noble) and Debian 13 (trixie).
Packages are built by [omakasui/build-packages](https://github.com/omakasui/build-packages)
and published here automatically via CI.

## Installation

```bash
# 1. Import the GPG key
curl -fsSL https://omakasui.github.io/apt-packages/omakasui.gpg.key \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/omakasui-apt-packages.gpg > /dev/null

# 2. Add the APT source
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/omakasui-apt-packages.gpg] \
https://omakasui.github.io/apt-packages \
$(. /etc/os-release && echo $VERSION_CODENAME) main" \
    | sudo tee /etc/apt/sources.list.d/omakasui-apt-packages.list

# 3. Update and install
sudo apt update
sudo apt install package
```

## Supported distributions

| Distribution     | Codename |
|------------------|----------|
| Ubuntu 24.04 LTS | noble    |
| Debian 13        | trixie   |

## Available packages

| Package | Version | Distros         | Architectures |
|---------|---------|-----------------|---------------|