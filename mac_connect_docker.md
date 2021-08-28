###  Mac电脑与docker容器通信解决方案

经过多次尝试找到一种解决方案 (若有同学有其它更换办法，欢迎告知!)

1. Mac 通过 brew 安装 docker-connector

   ```shell
    brew install wenjunxiao/brew/docker-connector
   ```

2. 执行以下命令把 docker 的所有 `bridge` 网络都添加到路由中

   ```shell
    docker network ls --filter driver=bridge --format "{{.ID}}" | xargs docker network inspect --format "route {{range .IPAM.Config}}{{.Subnet}}{{end}}" >> /usr/local/etc/docker-connector.conf
   ```

   或者修改 `/usr/local/etc/docker-connector.conf` 添加路由

   ```she
   route 172.30.1.0/24
   ```

3. 配置完成，重启服务

   ```shell
    sudo brew services start docker-connector
   ```

4. 使用以下命令在 docker 端运行 wenjunxiao/mac-docker-connector，需要使用 `host` 网络，并且允许 `NET_ADMIN，pull connector容器的作用是作为桥接`

   ```shell
    docker run -it -d --restart always --net host --cap-add NET_ADMIN --name connector wenjunxiao/mac-docker-connector
   ```