#!/usr/bin/env bash

# 创建目录

# 设置目录权限



# 下载并启动容器，且为 后台 自动启动
docker-compose up -d


# 显示 mysql 容器
docker ps |grep zoo1