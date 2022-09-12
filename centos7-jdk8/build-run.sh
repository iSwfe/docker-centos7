#!/bin/bash

path=./
imageName=centos7-jdk8
tag=v1.0
containerName=centos7-jdk8

cd $path
docker build -t $imageName:$tag .
# 删除上次容器
[ "$(docker ps -a | grep $containerName)" ] && docker rm -f $containerName
# 删除多余的<NONE>镜像
NONE_IMAGES_KEY=$(docker images -f "dangling=true" -q)
[ "$NONE_IMAGES_KEY" ] && docker rmi -f $NONE_IMAGES_KEY

# 启动，bash访问
docker run --name $containerName $imageName:$tag

