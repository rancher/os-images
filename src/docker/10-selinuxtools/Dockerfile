FROM rancher/os-ubuntuconsole-base
RUN apt-get update && \
    apt-get upgrade --no-install-recommends -y && \
    apt-get install -y --no-install-recommends iptables openssh-server rsync vim curl ca-certificates psmisc htop
RUN rm -rf /etc/ssh/*key*
RUN rm -fr /sbin/poweroff  /sbin/shutdown /sbin/reboot /sbin/halt /usr/sbin/poweroff  /usr/sbin/shutdown /usr/sbin/reboot /usr/sbin/halt
COPY build/entry.sh build/console.sh build/docker-init build/update-ssh-keys build/rancheros-install /usr/sbin/
RUN locale-gen en_US.UTF-8
RUN addgroup --gid 1100 rancher && \
    addgroup --gid 1101 docker && \
    useradd -u 1100 -g rancher -G docker,sudo -m -s /bin/bash rancher && \
    useradd -u 1101 -g docker -G docker,sudo -m -s /bin/bash docker && \
    echo ClientAliveInterval 180 >> /etc/ssh/sshd_config && \
    echo '## allow password less for rancher user' >> /etc/sudoers && \
    echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo '## allow password less for docker user' >> /etc/sudoers && \
    echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/docker.dist /usr/bin/docker

RUN apt-get install -y --no-install-recommends git make gcc python libselinux1 libsemanage1 selinux-policy-dev libselinux1-dev libsemanage1-dev checkpolicy

RUN git clone https://github.com/rancher/refpolicy.git /usr/src/refpolicy
RUN cd /usr/src/refpolicy && git submodule init && git submodule update && \
    sed -i '/MONOLITHIC = y/c\MONOLITHIC = n' build.conf && \
    make conf && make && make install-headers

ENTRYPOINT ["/usr/sbin/entry.sh"]
CMD ["/usr/sbin/console.sh"]
