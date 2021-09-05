#!/bin/bash
#################### 变量定义 ####################
mysql_user="slave"    # 主服务器允许从服务器登录的用户名
mysql_password="123456" # 主服务器允许从服务器登录的密码
root_password=bytearch            # 每台服务器的root密码
# 4组主从
node_num=4;

# 链接重试间隔时间 s
retry_duration=5

#################### 函数定义 ####################
# 获取服务器的ip
docker_ip() {
    docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
}

# docker-compose初始化
init() {
docker-compose down
for (( i=1; i <= $node_num; i++ )); do
  # 删除初始数据
  rm -rf ./db_${i}_master/data/* ./db_${i}_slave/data/*
done
docker-compose build
docker-compose up -d
}

test_container() {
    until docker exec $1 sh -c "export MYSQL_PWD=$root_password;mysql -uroot -e ';'"
    do
      echo "等待 $1 连接中,请稍候,每 ${retry_duration}s 尝试连接一次,可能会重试多次,直到容器启动完毕......"
      sleep $retry_duration
    done
    echo 'init success!!!'
}

# 在主服务器上添加数据库用户
create_user() {
  ## $1   添加用户
  docker exec $1 sh -c "export MYSQL_PWD=$root_password; mysql -u root -e \"GRANT REPLICATION SLAVE ON *.* TO '$mysql_user'@'%' IDENTIFIED BY '$mysql_password'; FLUSH PRIVILEGES;\""

  echo "create user success!!!"
  sleep 1
}

# 设置主从复制
set_replication() {
  echo "set_replication $1 -> $2"
  # 查看主服务器的状态
  MS_STATUS=`docker exec $1 sh -c "export MYSQL_PWD=$root_password; mysql -u root -e 'SHOW MASTER STATUS'"`

  # binlog文件名字,对应 File 字段,值如: mysql-bin.000004
  CURRENT_LOG=`echo $MS_STATUS | awk '{print $6}'`
  # binlog位置,对应 Position 字段,值如: 1429
  CURRENT_POS=`echo $MS_STATUS | awk '{print $7}'`


  echo "$CURRENT_LOG, $CURRENT_POS "

  #设置从服务器与主服务器互通命令
  start_slave_stmt="CHANGE MASTER TO
        MASTER_HOST='$(docker_ip $1)',
        MASTER_USER='$mysql_user',
        MASTER_PASSWORD='$mysql_password',
        MASTER_LOG_FILE='$CURRENT_LOG',
        MASTER_LOG_POS=$CURRENT_POS;"
  start_slave_cmd='export MYSQL_PWD='$root_password'; mysql -u root -e "'
  start_slave_cmd+="$start_slave_stmt"
  start_slave_cmd+='START SLAVE;"'

  # 从服务器连接主互通
  docker exec $2 sh -c "$start_slave_cmd"
  # 查看从服务器得状态
  docker exec $2 sh -c "export MYSQL_PWD=$root_password; mysql -u root -e 'SHOW SLAVE STATUS \G'"
  echo  " set_replication success!!! "
}


main() {
  init
  # 1. 等等初始化
  echo "sleep 20s wait container start....."
  sleep 20
  for (( i=1; i <= $node_num; i++ )); do
    master=db_${i}_master
    slave=db_${i}_slave
    echo " ***   $mysql_user , $mysql_password , $root_password"
    echo "master: $master, slave: $slave"
    # 测试 
    test_container $master $slave
    # 2. 创建用户
    create_user $master
    # 3. 设置主从复制
    set_replication $master $slave
  done
}
main

