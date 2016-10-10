FROM rancher/os-alpineconsole-base
# FROM amd64=alpine:3.4 arm64=skip arm=skip
RUN apk --no-cache add bash openssh iptables rsync sudo vim less curl ca-certificates htop kmod iproute2 util-linux
# locales psmisc
RUN rm -rf /etc/ssh/*key*
RUN rm -fr /sbin/poweroff  /sbin/shutdown /sbin/reboot /sbin/halt /usr/sbin/poweroff  /usr/sbin/shutdown /usr/sbin/reboot /usr/sbin/halt
#RUN ln -s /sbin/getty /sbin/agetty
COPY build/update-ssh-keys build/rancheros-install /usr/sbin/
#RUN locale-gen en_US.UTF-8
RUN addgroup -g 1100 rancher && \
    addgroup -g 1101 docker && \
    addgroup -S sudo && \
    adduser -D -u 1100 -g rancher -G sudo -s /bin/bash rancher && \
    adduser rancher docker && \
    adduser -D -u 1101 -g docker -G sudo -s /bin/bash docker && \
    adduser docker docker && \
    echo ClientAliveInterval 180 >> /etc/ssh/sshd_config && \
    echo '## allow password less for rancher user' >> /etc/sudoers && \
    echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo '## allow password less for docker user' >> /etc/sudoers && \
    echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/docker.dist /usr/bin/docker && \
    ln -sf /usr/bin/docker-containerd.dist /usr/bin/docker-containerd && \
    ln -sf /usr/bin/docker-containerd-shim.dist /usr/bin/docker-containerd-shim && \
    ln -sf /usr/bin/docker-runc.dist /usr/bin/docker-runc \
    echo 'ssh-keygen -A' >> /usr/sbin/update-ssh-keys
ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
CMD ["/usr/sbin/console.sh"]
