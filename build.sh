#!/bin/bash

set -ouex pipefail

### 1. Remove the pre-installed moby-engine and its components first
dnf5 remove -y moby-engine docker-cli

### 2. Install Packages
# Note: Many 'DX' packages (git, gcc, virt-manager, distrobox) are already in your base image.
# We are adding Docker, your CLI tools, and specific system utilities.

dnf5 install -y \
    docker \
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

### 2. Cleanup
# Removes metadata to keep the final image layer size down
dnf5 clean all

### 3. Service Management
# Disable Podman's default socket to prevent conflicts
systemctl disable podman.socket

# Enable Docker daemon and socket
systemctl enable docker.socket
systemctl enable docker.service

# Enable other installed services
systemctl enable tailscaled.service
