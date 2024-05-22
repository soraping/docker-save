# 创建必要文件
mkdir -p ./{kibana,logstash,filebeat,es}

# es
mkdir -p ./es/{data,logs,plugins}
chmod 777 ./es/{data,logs,plugins}



# kibana
mkdir -p ./kibana/{data,logs,plugins}


# logstash
mkdir -p ./logstash/{config,pipeline}


# filebeat
mkdir -p ./filebeat/{data,logs}


