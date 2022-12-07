docker tag 518a41981a6a localhost:5000/datanode
docker push localhost:5000/datanode

kubectl apply -f ./k8s/datanode.yaml
