#!/bin/bash
set -ouex pipefail

# 1. Add official Docker repository
dnf5 config-manager --add-repo https://download.docker.com

# 2. Remove conflicting pre-installed container packages
dnf5 remove -y moby-engine docker-cli containerd runc

# 3. Install only what is MISSING from Bazzite-DX
# (Removed ublue-bling, ublue-brew, and ublue-os-flatpak as they are deprecated)
dnf5 install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    tmux \
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
    tailscale

# 4. Cleanup
dnf5 clean all

# 5. Service Management
systemctl disable podman.socket
systemctl enable docker.socket
systemctl enable docker.service
systemctl enable tailscaled.service
