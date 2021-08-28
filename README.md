# docker-app
Common docker software, such as mysql, redis, rocketmq, etc., are convenient for normal testing without a lot of environment construction

### 1. create network
```shell
sh ./intall_network.sh

```

### 2. start docker app

 start all docker app

```shell
sh ./startAll.sh 

```

start one docker app eg:

```
cd mysql
sh start.sh

```

### 3. stop docker app

 stop all docker app
 ```shell
 sh ./stopAll.sh
 
 ```

 stop one docker app eg:

 ```shell
 cd mysql 
 ./stop.sh
 
 ```
