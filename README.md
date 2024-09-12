### elasticsearch

#### 密码

```bash
> docker  exec -it es容器Id bash

> cd /usr/share/elasticsearch/bin

# 批量设置
> elasticsearch-setup-passwords interactive



# 设置随机密码
> elasticsearch-reset-password -u elastic
# 设置自定义密码
> elasticsearch-reset-password -u elastic -i


# 设置 kibana 访问密码
> elasticsearch-reset-password -u kibana_system

```

#### 内置用户

```
elastic：总用户
kibana_system：这个用户用于Kibana实例与Elasticsearch集群之间的通信。
logstash_system：这个用户用于Logstash实例与Elasticsearch集群之间的通信。它具有向集群中写入数据所需的最小权限。
beats_system：这个用户用于Beats代理（如Filebeat、Metricbeat等）与Elasticsearch集群之间的通信。
apm_system：这个用户用于APM Server与Elasticsearch集群之间的通信。
remote_monitoring_user：这个用户用于监控Elasticsearch集群。它具有remote_monitoring_agent和remote_monitoring_collector内置角色。
ingest_manager：这个用户用于运行和管理Elasticsearch的数据摄取和管理功能。它具有执行数据摄取和管理任务所需的最小权限。
```

#### plugins

- ik 中文分词

```
https://github.com/infinilabs/analysis-ik
```


### 加入其他 docker-compose 文件内的网络

#### 查看网络

```bash
docker network ls
```

#### 建立公共网络

`mysql` 被很多项目引用，所以将 `mysql` 放在一个公共网络中 

```bash

# 创建网络时是可以添加一系列参数的：
# --driver：驱动程序类型
# --gateway：主子网的IPV4和IPV6的网关
# --subnet：代表网段的CIDR格式的子网
# mysql_net：自定义网络名称
docker network create --driver=bridge mysql_net
```

#### 将mysql容器放在这个网络中

```bash
version: '3.8'

services:

  mysql57:
    image: mysql:5.7.30
    restart: always
    networks:
      - external_net
    privileged: true
    container_name: mysql
    ports:
      - 3306:3306
    volumes:
      - /Users/caoping/www/docker/docker-file/base/mysql57/data:/var/lib/mysql
      - /Users/caoping/www/docker/docker-file/base/mysql57/conf:/etc/mysql/conf.d
      - /Users/caoping/www/docker/docker-file/base/mysql57/my.cnf:/etc/mysql/my.cnf
      - /Users/caoping/www/docker/docker-file/base/mysql57/logs:/var/log/mysql
    environment:
      - TZ=Asia/Shanghai
      - MYSQL_ROOT_PASSWORD=123456

networks:
  external_net:
    name: mysql_net
    external: true

```

#### 其他文件中依赖mysql的容器操作

```bash
version: '3.9'

services:

  zipkin-mysql:
    image: openzipkin/zipkin:latest
    container_name: zipkin-mysql
    ports:
      - '9410:9410'
      - '9411:9411'
    network_mode: host
    networks:
      - mysql_net
    environment:
      - STORAGE_TYPE=mysql
      - MYSQL_DB=zipkin_config
      - MYSQL_USER=root
      - MYSQL_PASS=123456
      - MYSQL_HOST=mysql
      - MYSQL_TCP_PORT=3306

networks:
  mysql_net:
    name: mysql_net
    external: true
```

#### 查看加入网络中的容器

```bash
docker network inspect mysql_net
```

