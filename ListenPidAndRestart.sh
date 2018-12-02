#!/bin/bash
#判断es的9200端口是否已经打开
port=`lsof -i:9200`
#如果9200不存在在尝试启动es的master进出并且发送邮件通知
if [ ! -n "$port" ];
then
{
echo '【'`date +"%Y-%m-%d %H:%M:%S"`】-----'【端口不存在，尝试启动es服务】'>>/Applications/shell/error.log
`echo "es出错重启es:9200" | mail -s "es出错" 1657210793@qq.com`
`/Applications/XAMPP/htdocs/es/elasticsearch_master/bin/elasticsearch -d`
}
else
{
#如果正常则写入日志
echo '【'`date +"%Y-%m-%d %H:%M:%S"`'】-----端口信息【'${port}'】'>>/Applications/shell/ok.log
}
fi
