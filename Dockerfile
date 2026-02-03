FROM alastairhm/alpine-lighttpd:latest

RUN apk --update add \
    php-common \
    php-iconv \
    php-json \
    php-gd \
    php-curl \
    php-xml \
    php-simplexml \
    php-pgsql \
    php-imap \
    php-cgi \
    fcgi \
    php-pdo \
    php-pdo_pgsql \
    php-soap \
    php-posix \
    php-gettext \
    php-ldap \
    php-ctype \
    php-dom \
		php-mbstring \
		php-intl \
		php-fileinfo \
		php-mysqli \
		php-xmlreader \
		imagemagick \
		shadow \
		bash && \
    rm -rf /var/cache/apk/*

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN usermod -u 33 www-data && \
		groupmod -g 33 www-data && \
		mkdir -p /run/lighttpd/ && \
    chown www-data:www-data /run/lighttpd/

EXPOSE 80
VOLUME /var/www

CMD php-fpm -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf

