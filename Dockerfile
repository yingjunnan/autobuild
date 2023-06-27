# 基于CentOS镜像
FROM centos:latest

# 安装EPEL仓库
RUN yum install -y epel-release

# 安装Nginx
RUN yum install -y nginx

# 安装PHP 7.4和相关扩展
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum install -y php php-fpm php-mysqlnd php-pgsql php-sqlite php-intl php-gd \
       php-curl php-mbstring php-xml php-zip php-json php-ldap php-redis php-opcache

# 复制Nginx配置文件
# COPY nginx.conf /etc/nginx/nginx.conf

# 复制PHP-FPM配置文件
# COPY php-fpm.conf /etc/php-fpm.d/www.conf

# 创建PHP配置目录
RUN mkdir -p /etc/php/conf.d

# 设置工作目录
WORKDIR /var/www/html

# 暴露端口
EXPOSE 80

# 启动Nginx和PHP-FPM
CMD sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php-fpm.conf \
    && sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php.ini \
    && php-fpm -D && nginx -g "daemon off;"
