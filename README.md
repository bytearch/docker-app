# docker-app

Common docker software, such as mysql, redis, rocketmq, etc., are convenient for normal testing without a lot of environment construction

# 文章说明

[浅谈工作中常用应用软件本地docker化，一键部署它不香吗？](https://mp.weixin.qq.com/s?__biz=MzU5NTg1ODg2MQ==&mid=2247484089&idx=1&sn=a61f8c0e7d821375f3a8e95d5449f360&chksm=fe6ac67bc91d4f6d14c1806eebd6f37ea98d2052f09c2c4579070a1eb9d0761fb6bebf84c73e&token=193383604&lang=zh_CN#rd)

### 1. Host planning

Subnet=172.30.1.0/24  

Gateway: 172.30.1.1   

| app              | ip                               | 说明                             |
| ---------------- | -------------------------------- | -------------------------------- |
| Mysql            | 172.30.1.2                       | mysql单机                |
| RocketMq-namesrv | 172.30.1.3                       |                        |
| RocketMq-broker  | 172.30.1.4                       |                        |
| Rocketmq-console | 172.30.1.5                       |                        |
| Zookeeper        | 172.30.1.6,172.30.1.7,172.30.1.8 | ZK集群 |
| Redis            | 172.30.1.9                       |                        |
| Nacos            | 172.30.1.10                      |                       |
| Nginx            | 172.30.1.11                      |                       |
| Elasticsearch    | 172.30.1.12                      | ES单机版                 |
| Mysql-Cluster    | 172.30.1.21 ~ 172.30.1.40        | Mysql多主多从 |
| Gitlab           | 172.30.1.50                      | Gitlab                |
| Nexus3           | 172.30.1.51                      | Maven私服               |
| ELK              | 172.30.1.52 ~ 172.30.1.54| ES + Kibana+Logstash |
| Prometheus       | 172.30.1.55                      |                       |
| Cadvisor | 172.30.1.56 | Docker服务监控数据采集 |
| Grafana | 172.30.1.57 | 监控展示 |
| Skywalking       | server: 172.30.1.58    web: 172.30.1.59               |             链路追踪          |
|redis-cluster|172.30.1.61,172.30.1.62,172.30.1.63 172.30.1.64,172.30.1.65,172.30.1.66|redis-cluster集群|

Other software services will be supplemented in succession

### 2. Install


##### 1). create network
```shell
sh ./intall_network.sh

```

If you are a MAC system, you may need to take a look  at file "./mac_connect_docker.md"


##### 2). start docker app

 start all docker app

```shell
sh ./startAll.sh 

```

start one docker app eg:

```
cd mysql
sh start.sh

```

##### 3). stop docker app

 stop all docker app
 ```shell
 sh ./stopAll.sh
 
 ```

 stop one docker app eg:

 ```shell
 cd mysql 
 ./stop.sh
 
 ```
