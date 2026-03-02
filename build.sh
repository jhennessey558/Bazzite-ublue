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
    gcc \
    gcc-c++ \
    gcc-gfortran \
    make \
    fastfetch \
    htop \
    duf \
    cmake \
    git \
    fuse \
    fprintd \
    fprintd-pam \
    tcl8-devel \
    tk8-devel \
    python-pyqt6 \
    python-pyqt6-webengine \
    edk2-ovmf \
    libvirt \
    libvirt-nss \
    onedrive \
    PackageKit \
    docker \
    distrobox \
    podman-compose \
    podman-machine \
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

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket