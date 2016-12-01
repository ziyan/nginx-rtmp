FROM busybox

ADD nginx/objs/nginx /opt/nginx/sbin/nginx
ADD nginx.conf /opt/nginx/conf/nginx.conf

EXPOSE 1935

USER www-data
CMD ["/opt/nginx/sbin/nginx"]
