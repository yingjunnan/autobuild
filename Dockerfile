# 使用基于Ubuntu的Docker镜像作为基础
FROM registry.cn-beijing.aliyuncs.com/yingjunnan/ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
# 设置环境变量
ENV ORACLE_HOME=/usr/lib/oracle/12.2/client64
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV PATH=$ORACLE_HOME/bin:$PATH

# 安装必要的软件包
RUN apt-get update && \
    apt-get install -y nginx php7.4-fpm php7.4-pear php7.4-dev libaio-dev \
    php7.4-mysql php7.4-redis unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/lib/oracle/12.2 && chmod 777 /usr/lib/oracle/12.2

# 下载Oracle Instant Client安装包
ADD https://download.oracle.com/otn_software/linux/instantclient/19800/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip /tmp/

# 解压安装包并设置Oracle环境变量
RUN unzip /tmp/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip -d /usr/lib/oracle/12.2/ && \
    rm /tmp/instantclient-basic-linux.x64-19.8.0.0.0dbru.zip && \
    ln -s /usr/lib/oracle/12.2/instantclient_19_8 $ORACLE_HOME && \
    echo $ORACLE_HOME > /etc/ld.so.conf.d/oracle.conf && \
    ldconfig

EXPOSE 80

# 配置Nginx
# COPY nginx.conf /etc/nginx/nginx.conf

# 配置PHP-FPM
# COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# 复制启动脚本
COPY start.sh /start.sh

# 修改脚本权限
RUN chmod +x /start.sh

# 启动脚本
CMD ["/start.sh"]
