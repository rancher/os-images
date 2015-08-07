FROM ubuntu:14.04.2
RUN apt-get update && \
    apt-get upgrade --no-install-recommends -y && \
    apt-get install -y --no-install-recommends openssh-server rsync vim curl
RUN rm -rf /etc/ssh/*key*
COPY build/entry.sh /usr/sbin/
COPY build/console.sh /usr/sbin/
COPY build/docker.sh /usr/sbin/
COPY build/update-ssh-keys /usr/bin/
COPY build/rancheros-install /usr/sbin/
RUN echo 'RancherOS \\n \l' > /etc/issue
RUN locale-gen en_US.UTF-8
RUN addgroup --gid 1100 rancher && \
    addgroup --gid 1101 docker && \
    useradd -u 1100 -g rancher -G docker,sudo -m -s /bin/bash rancher && \
    useradd -u 1101 -g docker -G docker,sudo -m -s /bin/bash docker && \
    echo ClientAliveInterval 180 >> /etc/ssh/sshd_config && \
    echo '## allow password less for rancher user' >> /etc/sudoers && \
    echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ENTRYPOINT ["/usr/sbin/entry.sh"]
CMD ["/usr/sbin/console.sh"]
