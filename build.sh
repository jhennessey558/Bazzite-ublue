#!/bin/bash
set -ouex pipefail

# 1. Enable Required Repositories
dnf5 config-manager --add-repo https://download.docker.com
dnf5 copr enable -y ublue-os/packages
dnf5 copr enable -y ublue-os/staging

# 2. Remove Conflicting Packages
# Must remove moby-engine before installing docker-ce
dnf5 remove -y moby-engine docker-cli containerd runc

# 3. Install Docker CE and uBlue Utilities
dnf5 install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    tmux \
    antigravity \
    fastfetch \
    htop \
    duf \
    fprintd \
    fprintd-pam \
    tcl8-devel \
    tk8-devel \
    python-pyqt6 \
    python-pyqt6-webengine \
    onedrive \
    tailscale \
    ublue-os-luks \
    ublue-os-just \
    ublue-bling \
    ublue-brew \
    ublue-os-flatpak \
    ublue-os-media-automount-udev \
    ublue-os-udev-rules \
    flatpak-builder \
    flatpak-spawn

# 4. Cleanup and Service Management
dnf5 copr disable -y ublue-os/packages
dnf5 copr disable -y ublue-os/staging
dnf5 clean all

systemctl disable podman.socket
systemctl enable docker.socket
systemctl enable docker.service
systemctl enable tailscaled.service
