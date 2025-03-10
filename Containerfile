FROM quay.io/centos-bootc/centos-bootc:stream10 AS builder
RUN rm -rf /etc/yum.repos.d
COPY eln.repo /etc/yum.repos.d/eln.repo
RUN sed -i -e 's@- dnf-bootc@@g' -e 's@- dnf-yum@@g' /usr/share/doc/bootc-base-imagectl/manifests/includes/centos-stream.yaml
RUN sed -i 's@- dnf-yum@@g' /usr/share/doc/bootc-base-imagectl/manifests/standard.yaml
RUN /usr/libexec/bootc-base-imagectl build-rootfs --manifest=standard /out
FROM scratch AS eln-bootc
COPY --from=builder /out /
LABEL containers.bootc 1
LABEL bootc.diskimage-builder quay.io/centos-bootc/bootc-image-builder
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
