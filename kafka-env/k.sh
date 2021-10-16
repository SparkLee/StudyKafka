#!/bin/bash

dir=$(dirname "$0")

# kafka 程序目录
kafkaDir="$dir"/kafka_2.13-3.0.0

# kafka 配置目录
confDir="$dir"/config

# 为 kafka 命令脚本文件添加可执行权限
chmod +x "$kafkaDir"/bin/*

case $1 in
"start"){
  case $2 in
  "all"){
    echo "===> 一键启动 zookeeper 和 kafka 服务："
    "$kafkaDir"/bin/zookeeper-server-start.sh -daemon "$confDir"/zookeeper.properties
    "$kafkaDir"/bin/kafka-server-start.sh -daemon "$confDir"/server.properties
  };;
  esac
};;

"stop"){
  case $2 in
    "all"){
      echo "===> 一键停止 zookeeper 和 kafka 服务："
      "$kafkaDir"/bin/zookeeper-server-stop.sh "$confDir"/zookeeper.properties
      "$kafkaDir"/bin/kafka-server-stop.sh "$confDir"/server.properties
    };;
    esac
};;
esac