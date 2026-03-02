#!/bin/bash
set -ouex pipefail

# 1. Manually download and fix the Docker repo file for DNF5 compatibility
curl -Lo /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/fedora/docker-ce.repo
# This removes lines starting with # (comments) which cause the "missing section header" error
sed -i '/^#/d' /etc/yum.repos.d/docker-ce.repo

# 2. Remove conflicting pre-installed Moby packages
dnf5 remove -y moby-engine docker-cli containerd runc

# 3. Install Docker CE and other missing utilities
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

# 4. Cleanup and Service Management
dnf5 clean all
systemctl disable podman.socket
systemctl enable docker.socket
systemctl enable docker.service
systemctl enable tailscaled.service

