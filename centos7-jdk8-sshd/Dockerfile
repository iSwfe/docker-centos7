#!/bin/bash

# 使用CentOS7作为基础镜像
FROM centos7-jdk8:v1.0

# 维护人信息
MAINTAINER iSwfe

# 安装OpenSSH-Server
RUN yum install -y openssh-server

# 配置sshd
RUN echo "root:123" | chpasswd
RUN echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local
#RUN ssh-keygen -A
# 固定主机密钥
COPY ssh/ssh_host_rsa_key /etc/ssh/
COPY ssh/ssh_host_rsa_key.pub /etc/ssh/
EXPOSE 22

# 启动sshd
WORKDIR /root
ENTRYPOINT ["bash", "-c", "/usr/sbin/sshd -D"]

