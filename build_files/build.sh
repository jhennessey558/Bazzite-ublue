#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y \
    tmux \
    antigravity \
    dnf-plugins-core \
    zsh \
    git \
    make \
    fastfetch \
    htop \
    duf \
    cmake \
    fuse \
    fprintd \
    fprintd-pam \
    tcl8-devel \
    tk8-devel \
    docker \
    distrobox \
    podman-compose \
    podman-machine \
    tailscale \
    ublue-os-libvirt-workarounds \
    ublue-os-update-services \
    ublue-os-signing \
    ublue-os-luks \
    ublue-os-just \
    ublue-bling \
    ublue-brew \
    ublue-os-flatpak \
    ublue-os-media-automount-udev \
    ublue-os-udev-rules \
    flatpak-builder \
    flatpak-spawn

### C/C++ Development Tools
dnf5 install -y \
    gcc \
    gcc-c++ \
    gcc-gfortran \
    clang \
    clang-tools-extra \
    llvm-devel

### Rust Development
dnf5 install -y \
    rust \
    cargo \
    rustfmt \
    clippy

### Python Development
dnf5 install -y \
    python3 \
    python3-devel \
    python3-pip \
    python-pyqt6 \
    python-pyqt6-webengine \
    python3-virtualenv \
    pipenv \
    poetry

### Node.js Development
dnf5 install -y \
    nodejs \
    npm \
    yarn

### Go Development
dnf5 install -y \
    golang

### Ruby Development
dnf5 install -y \
    ruby \
    ruby-devel

### Java Development
dnf5 install -y \
    java-latest-openjdk \
    java-latest-openjdk-devel \
    maven

### Security Tools
dnf5 install -y \
    openssl \
    openssh-clients \
    openssh-server \
    git-crypt \
    gnupg \
    pass \
    fail2ban \
    aide \
    nmap \
    wireshark \
    hashcat \
    john \
    sqlmap \
    metaexploit-framework \
    tripwire \
    auditd \
    lynis \
    rkhunter

### Development Utilities
dnf5 install -y \
    git-lfs \
    gh \
    direnv \
    fzf \
    ripgrep \
    bat \
    exa \
    neovim \
    vim \
    tmux \
    screen \
    htop \
    iotop \
    perf \
    valgrind \
    gdb \
    strace \
    ltrace

### Container & Virtualization
dnf5 install -y \
    edk2-ovmf \
    libvirt \
    libvirt-nss \
    qemu-char-spice \
    qemu-device-display-virtio-gpu \
    qemu-device-display-virtio-vga \
    qemu-device-usb-redirect \
    qemu-img \
    qemu-system-x86-core \
    qemu-user-binfmt \
    qemu-user-static \
    qemu \
    virt-manager \
    PackageKit

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable libvirtd
systemctl enable auditd
