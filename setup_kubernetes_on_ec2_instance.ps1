aws configure

sudo yum update -y

curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

wget https://github.com/kubernetes/kops/releases/download/1.10.0/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv ./kops-linux-amd64 /usr/local/bin/kops

aws s3 ls

aws s3 mb s3://a2b2c2d2-kops-state-store --region us-east-2

aws s3api put-bucket-versioning --bucket a2b2c2d2-kops-state-store1 --versioning-configuration Status=Enabled

export KOPS_STATE_STORE=s3://a2b2c2d2-kops-state-store1

kops create cluster --node-count=3 --node-size=t2.micro --zones=us-east-1a --name=hadoopcluster.k8s.local

kops get cluster

ssh-keygen -o

kops create secret --name hadoopcluster.k8s.local sshpublickey admin -i ~/.ssh/id_rsa.pub

kops update cluster hadoopcluster.k8s.local --yes

kops rolling-update cluster --cloudonly

kops validate cluster

kubectl cluster-info

kops get secrets kube --type secret -oplaintext
generated secret : zHvhu5iuzsQmvKpIcMzqejfBn8NfLJwz

kubectl get services

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

