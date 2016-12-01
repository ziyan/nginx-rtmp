FROM busybox

ADD nginx/objs/nginx /sbin/nginx
ADD nginx.conf /etc/nginx.conf

VOLUME ["/tmp"]

EXPOSE 1935

USER www-data
CMD ["/sbin/nginx"]
