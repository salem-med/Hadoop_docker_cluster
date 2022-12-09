docker run -d -p 5000:5000 --restart=always --name local-registry registry:2
docker tag namenode localhost:5000/namenode
docker tag datanode localhost:5000/datanode
docker push localhost:5000/namenode
docker push localhost:5000/datanode
