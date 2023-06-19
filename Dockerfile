FROM registry.cn-beijing.aliyuncs.com/yingjunnan/zabbix:zabbix-server-mysql-5.0-centos-latest
USER root
# 更新yum源缓存
#RUN rm -rf /etc/yum.repos.d/*
#COPY CentOS-Base.repo /etc/yum.repos.d
#RUN yum clean all
#RUN yum makecache
RUN yum install -y python3
USER zabbix
