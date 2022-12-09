#  build datanode
# REM if NOT "$(docker images -q datanode:latest)"=="" (docker image rm datanode:latest)

docker build -t datanode:latest -f DataNode/Dockerfile .

# REM build namenode
# REM if NOT "$(docker images -q namenode:latest)"=="" (docker image rm namenode:latest)

docker build -t namenode:latest -f NameNode/Dockerfile .
