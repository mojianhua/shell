#!/bin/bash
#查询端口并且杀掉进程
pid=`lsof -i:9200 | awk 'NR!=1{print $2}'`
`kill -9 ${pid}`
