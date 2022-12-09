mkdir -p /centos/.kube
cp -i /etc/kubernetes/admin.conf /centos/.kube/config
chown 0:0 /centos/.kube/config
