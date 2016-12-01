.PHONY: all
all: docker

.PHONY: nginx
nginx:
	cd nginx && \
		./auto/configure \
		--prefix= \
		--sbin-path=/sbin/nginx \
		--conf-path=/etc/nginx.conf \
		--pid-path=/tmp/nginx.pid \
		--lock-path=/tmp/nginx.lock \
		--error-log-path=/dev/stderr \
		--http-log-path=/dev/stdout \
		--http-client-body-temp-path=/tmp \
		--http-proxy-temp-path=/tmp \
		--with-cc-opt="-static -static-libgcc" --with-ld-opt="-static" --with-cpu-opt=generic \
		--add-module=../nginx-rtmp-module \
		$$(./auto/configure --help | grep without | awk '{print $$1}' | grep -v '^--without-http$$' | grep -v '^--without-select_module$$' | grep -v '^--without-poll_module$$')
	$(MAKE) -C nginx

.PHONY: docker
docker: nginx
	docker build -t ziyan/nginx-rtmp .

