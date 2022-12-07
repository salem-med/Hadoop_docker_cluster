# create new network
docker network create -d bridge hadoop_net

docker rm $(docker ps --filter status=exited -q)

# run namenode
docker run -it --net hadoop_net --hostname namenode-master -p 9870:9870 -p 9000:9000 -p 50030:50030 --name namenode1 namenode:latest

# run datanode
docker run -it --net hadoop_net --name datanode1 datanode:latest