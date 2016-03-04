FROM rancher/os-resizefs-base
RUN apt-get update && \
    apt-get install -y --no-install-recommends parted && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY resizefs.sh /
ENTRYPOINT ["/resizefs.sh"]
