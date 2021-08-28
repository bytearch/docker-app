# docker-app
Common docker software, such as mysql, redis, rocketmq, etc., are convenient for normal testing without a lot of environment construction


### 1. Host planning

Subnet=172.30.1.0/24  

Gateway: 172.30.1.1   

| app              | ip                               |
| ---------------- | -------------------------------- |
| Mysql            | 172.30.1.2                       |
| RocketMq-namesrv | 172.30.1.3                       |
| RocketMq-broker  | 172.30.1.4                       |
| Rocketmq-console | 172.30.1.5                       |
| Zookeeper        | 172.30.1.6,172.30.1.7,172.30.1.8 |
| Redis            | 172.30.1.9                       |
| Nacos            | 172.30.1.10                      |
Other software services will be supplemented in succession

### 2. Install


##### 1. create network
```shell
sh ./intall_network.sh

```

##### 2. start docker app

 start all docker app

```shell
sh ./startAll.sh 

```

start one docker app eg:

```
cd mysql
sh start.sh

```

##### 3. stop docker app

 stop all docker app
 ```shell
 sh ./stopAll.sh
 
 ```

 stop one docker app eg:

 ```shell
 cd mysql 
 ./stop.sh
 
 ```
