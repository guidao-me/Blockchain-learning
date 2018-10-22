#Cluster-building

主要包含在开发测试时，测试环境的快速搭建脚本。

- gethup.sh：辅助启动测试集群
- gethcluster.sh：启动本地集群 
- gattach.sh：通过rpc连接启动的启动的geth服务

#使用说明

## 集群启动

sh gethcluster.sh <datadir> <network_id> <cluster_count> <IP> [[params]...]

这将建立一个本地集群

- <datadir>：集群的数据存储根目录，根据集群节点的启动，数据会存储在<datadir>/<network_id>/00，<datadir>/<network_id>/01...
- <network_id>：网络id，节点直接只有相同的network_id才能相互连接组网，主网的networkid为1,如果为不是1，则连接私有网络
- <cluster_count>：集群中启动的节点个数
- - ip：本机ip地址，集群节点相互连接组网时需要
- 将会为每个新启动的节点创建一个账户，账户密码分别为00,01,02...
- tcp监听端口分别为30300,30301,30301...
- rpc服务监听端口分别为8100,8101,8102...
- 将会为每个节点建立日志<datadir>/<network_id>/log/01.log,<datadir>/<network_id>/log/02.log...,可使用tail -f <datadir>/<network_id>/log/01.log查看日志
- 节点启动之后会自己组网相互连接

如：sh gethcluster.sh ./data 15 01 192.168.0.132

则会建立一个数据存储目录：./data/15 ,启动网络的network_id为15，启动的集群节点个数为1,192.168.0.132为本机ip，还可以添加一些其他参数

当需要通过genesis.json文件初始化启动集群时，只需要通过命令

sh gethcluster.sh <datadir> <network_id> <cluster_count> <IP> genesis.json

则会自动加载初始化文件启动集群

如：sh gethcluster.sh ./data 15 08 192.168.58.128 genesis.json

则会通过genesis.json文件初始化集群节点


##集群关闭
killall -QUIT geth

可关闭所有启动的节点

##集群服务连接
sh gattach 1

当需要连接集群中节点1时，只需要使用sh gattach.sh 1连接，同理可连接其他节点，连接之后可发送命令。




