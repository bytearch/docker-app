## Mysql 主从集群 4主4从


MySQL master-slave replication with using Docker.


### 主机规划

 
 |名称|IP|
 |-----------|--------------|
 |db_1_master|172.30.1.21|
 |db_1_slave|172.30.1.31|
 |db_2_master|172.30.1.22|
 |db_2_slave|172.30.1.32|
 |db_3_master|172.30.1.23|
 |db_3_slave|172.30.1.33|
 |db_4_master|172.30.1.24|
 |db_4_slave|172.30.1.34|


 ### 默认配置

 root用户密码: bytearch


 ### 安装

 ```shell
 sh ./make.sh
 
 ```



 ### 常用命令(以 db_1为例）

 ##### 进入mysql:

```shell
#主库
 mysql -h 172.30.1.21 -uroot -pbytearch

#从库
 mysql -h 172.30.1.31 -uroot -pbytearch

```
 ##### 进入容器

 ```shell
 #主
 docker exec -it db_1_master /bin/bash

 #从
 docker exec -it db_1_slave /bin/bash
 
 ```


 ##### 查看运行状态

 ```shell
 #主
 docker exec db_1_master sh -c 'mysql -u root -pbytearch -e "SHOW MASTER STATUS \G"'
 #从
 docker exec db_1_slave sh -c 'mysql -u root -pbytearch -e "SHOW SLAVE STATUS \G"' 
 ```
