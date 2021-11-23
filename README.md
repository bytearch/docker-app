# docker-app
Common docker software, such as mysql, redis, rocketmq, etc., are convenient for normal testing without a lot of environment construction


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
