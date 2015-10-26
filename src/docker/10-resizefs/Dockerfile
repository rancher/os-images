FROM debian:jessie
RUN apt-get update && \
    apt-get install -y --no-install-recommends parted
COPY resizefs.sh /
ENTRYPOINT ["/resizefs.sh"]
