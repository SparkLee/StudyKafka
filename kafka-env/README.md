# Kafka 环境

一键启/停 zookeeper 和 kafka 服务：

```shell
$ chmod +x k.sh

$ ./k.sh <start|stop> all
```

查看运行中的 java 进程：

```shell
$ jps
```

# 命令行工具

topic(主题)的CRUD：

```shell
# 切入 kafka 安装目录
$ cd /home/StudyKafka/kafka-env/kafka_2.13-3.0.0/

# 创建 topic
$ bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1

# 查看全部 topic 的名字列表
$ bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# 查看 topic 详情
$ bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092

# 修改 topic
# * 只能增加分区数不能减少分区数
$ bin/kafka-topics.sh --alter --topic quickstart-events --bootstrap-server localhost:9092 --partitions 4

# 删除 topic
$ bin/kafka-topics.sh --delete --topic quickstart-events --bootstrap-server localhost:9092 
```

event(事件)的CRUD：
```shell
# 写(生产)事件
$ bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092

# 读(消费)事件
$ bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```

zookeeper客户端：
```shell
# 连接zookeeper服务：
$ bin/zookeeper-shell.sh localhost:2181

# 查看zookeeper根节点下所有的子节点
ls /

# 查看zookeeper中存储的所有主题
ls /brokers/topics
```

# 数据/日志目录

数据存放目录：
```shell
# kafka 事件持久化目录
$ cat kafka-env/config/server.properties
> log.dirs=/tmp/kafka-logs

# zookeeper 持久化目录
$ cat kafka-env/config/zookeeper.properties
> dataDir=/tmp/zookeeper
```

日志存放目录：
```shell
# 日志默认存放在kafka安装目录下的logs目录下
$ ll /home/StudyKafka/kafka-env/kafka_2.13-3.0.0/logs/

# 自定义日志目录
$ cat kafka-env/kafka_2.13-3.0.0/bin/kafka-run-class.sh
> LOG_DIR="/var/log/kafka"
```

# Windows 下运行 Kafka

报错处理：
> 错误信息：The input line is too long. The syntax of the command is incorrect：
> 
> [解决方案参考](https://narayanatutorial.com/jms/apache-kafka/the-input-line-is-too-long-the-syntax-of-the-command-is-incorrect)
> | [本项目解决方案 commit 参考](https://github.com/SparkLee/StudyKafka/commit/a390ce75566919f608926eb1194eb28f0ba96075)

启动 zookeeper/kafka 服务：
```shell
# 切入kafka程序目录
$ cd kafka-env/kafka_2.13-3.0.0

# 启动 zookeeper 服务（注意命令要用引号括起来，否则报错）
$ "bin\windows\zookeeper-server-start.bat" "config\zookeeper.properties"

# 启动 kafka 服务
$ ！！！ 总报错啊，放弃，还是不要在 windows 下玩儿 kafka 了，老实用 linux 吧 ！！！
```

# 参考资料

- [APACHE KAFKA QUICKSTART](http://kafka.apache.org/quickstart)
- [B站视频-尚硅谷Kafka教程(消息队列kafka快速入门)](https://www.bilibili.com/video/BV1a4411B7V9)