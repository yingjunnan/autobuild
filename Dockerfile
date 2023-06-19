FROM registry.cn-beijing.aliyuncs.com/yingjunnan/zabbix:zabbix-server-mysql-5.0-centos-latest
# 
USER root
RUN yum install -y python3
RUN pip3 install dingtalkchatbot
