#!/bin/bash

# 使用CentOS7作为基础镜像
FROM centos:7.9.2009

# 维护人信息
MAINTAINER iSwfe

# 时区
ENV TZ=Asia/Shanghai

# RPM安装JDK
WORKDIR /root/Downloads
RUN curl https://mirrors.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.rpm -o jdk8.rpm \
    && yum install -y jdk8.rpm \
    && rm -rf jdk8.rpm

# 切换到usr/local 目录下,没有则创建
#WORKDIR /usr/local/
# 将下载的JDK的压缩包拷贝到镜像中，注意ADD和COPY的区别，ADD会解压，COPY不会解压
#ADD jdk-8u192-linux-x64.tar.gz /usr/local
## 设置JAVA_HOME 的环境变量
#ENV JAVA_HOME /usr/local/jdk1.8.0_192
## 设置JAVA 环境
#ENV CLASSPATH=$JAVA_HOME/bin:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
## 将java可执行文件设置到PATH中，这样就可以使用java命令了
#ENV PATH=.:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

# 安装常用工具集
RUN curl https://mirrors.aliyun.com/repo/Centos-7.repo -o /etc/yum.repos.d/CentOS-Base.repo
RUN curl https://mirrors.aliyun.com/repo/epel-7.repo -o /etc/yum.repos.d/epel.repo
RUN sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
# 已经指定了源，因此无需挑选最快源，防止进展太慢
RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf
RUN sed -i 's/plugins=1/plugins=0/g' /etc/yum.conf
RUN yum makecache
RUN yum install -y wget telnet lsof net-tools less lrzsz unzip

# 切换回工作目录到家目录
WORKDIR /root

# 入口
CMD ["java", "-version"]

