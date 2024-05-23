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

