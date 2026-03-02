# 1. Stage for build context (scripts/files)
FROM scratch AS ctx
COPY build_files/ /scripts/

# 2. Main image build
FROM ghcr.io/ublue-os/bazzite-dx-nvidia:stable

# Reference scripts from the 'ctx' stage without copying them permanently
RUN --mount=type=bind,from=ctx,source=/scripts,target=/tmp/scripts \
    /tmp/scripts/your-build-script.sh && \
    rm -rf /tmp/* || true

# Standard Bazzite/Fedora Atomic cleanup
RUN rpm-ostree cleanup -a && \
    ostree container commit
