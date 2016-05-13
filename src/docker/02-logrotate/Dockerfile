FROM rancher/os-base
COPY logrotate.sh /
RUN sed -i  's/\/var\/log\/user.*/\/var\/log\/*docker* {/g' /etc/logrotate.conf
CMD ["/logrotate.sh"]
