```
# kafka
# 配置分组id
KAFKA_BROKER_ID=1
# 开启自动创建主题
KAFKA_AUTO_CREATE_TOPICS_ENABLE=true
# 连接zookeeper
KAFKA_ZOOKEEPER_CONNECT=公网ip:2181
# 默认内存,调小一点不然启动报错内存溢出
KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
# 配置外网ip访问kafka
KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://公网ip:9092
# 配置kafka的监听端口
KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092
```