#!/bin/bash

# 使用CentOS7作为基础镜像
FROM centos7-jdk8:v1.0-sshd

# 维护人信息
MAINTAINER iSwfe

# 配置可信机器的公钥，方便登录
COPY authorized_keys /root/.ssh/
EXPOSE 22

# 启动sshd
WORKDIR /root
ENTRYPOINT /usr/sbin/sshd -D

