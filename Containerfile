FROM quay.io/centos-bootc/centos-bootc:stream10 AS builder
RUN rm -rf /etc/yum.repos.d
COPY eln.repo /etc/yum.repos.d/eln.repo
COPY ourmanifest.yaml /usr/share/doc/bootc-base-imagectl/manifests/ourmanifest.yaml
COPY fedora-bootc-legacy /usr/share/doc/bootc-base-imagectl/manifests/fedora-bootc-legacy
RUN /usr/libexec/bootc-base-imagectl build-rootfs --manifest=ourmanifest /out
FROM scratch AS eln-bootc
COPY --from=builder /out /
LABEL containers.bootc 1
LABEL bootc.diskimage-builder quay.io/centos-bootc/bootc-image-builder
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
