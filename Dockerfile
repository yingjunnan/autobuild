# 使用官方的 php 镜像作为基础镜像
FROM php:7.4-fpm

# 安装 nginx
RUN apt-get update && apt-get install -y nginx

# 将 nginx 配置文件复制到容器中
# COPY nginx.conf /etc/nginx/

# 将 php 代码复制到容器中
# COPY . /var/www/html/

# 设置工作目录
WORKDIR /var/www/html

# 暴露端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]
