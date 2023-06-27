# 基于Ubuntu镜像
FROM ubuntu:latest

# 安装Nginx
RUN apt-get update && apt-get install -y nginx

# 安装PHP和相关扩展
RUN apt-get install -y \
    php-fpm \
    php-mysql \
    php-pgsql \
    php-sqlite3 \
    php-intl \
    php-gd \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    php-json \
    php-ldap \
    php-redis \
    php-openssl \
    php-opcache

# 复制Nginx配置文件
# COPY nginx.conf /etc/nginx/nginx.conf

# 复制PHP-FPM配置文件
#  COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# 设置工作目录
WORKDIR /var/www/html

# 暴露端口
EXPOSE 80

# 启动Nginx和PHP-FPM
CMD service php7.4-fpm start && nginx -g "daemon off;"
