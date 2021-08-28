#!/usr/bin/env bash

# 创建目录
mkdir -p ./conf
mkdir -p ./data

# 设置目录权限
chmod -R 777 ./conf
chmod -R 777 ./data


# 下载并启动容器，且为 后台 自动启动
docker-compose up -d


# 显示 redis 容器
docker ps |grep redis