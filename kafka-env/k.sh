#!/bin/bash

dir=$(dirname "$0")
kafkaDir="$dir"/kafka_2.13-3.0.0

case $1 in
"start"){
  case $2 in
  "all"){
    echo "===> 一键启动 zookeeper 和 kafka 服务："
    "$kafkaDir"/bin/zookeeper-server-start.sh -daemon "$kafkaDir"/config/zookeeper.properties
    "$kafkaDir"/bin/kafka-server-start.sh -daemon "$kafkaDir"/config/server.properties
  };;
  esac
};;

"stop"){
  case $2 in
    "all"){
      echo "===> 一键停止 zookeeper 和 kafka 服务："
      "$kafkaDir"/bin/zookeeper-server-stop.sh "$kafkaDir"/config/zookeeper.properties
      "$kafkaDir"/bin/kafka-server-stop.sh "$kafkaDir"/config/server.properties
    };;
    esac
};;
esac