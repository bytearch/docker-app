#!/usr/bin/env bash
#清除 已创建的 docker
docker-compose down

# 删除 产生的 日志及临时文件
#rm -rf ./rmqs/logs/*
#rm -rf  ./rmqs/store/*
#rm -rf  ./rmq/logs/*
#rm -rf  ./rmq/store/*