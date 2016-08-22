FROM alpine:3.4
RUN apk --purge --no-cache add kmod bash openssl
COPY extra.sh  /usr/bin
CMD ["extra.sh"]
