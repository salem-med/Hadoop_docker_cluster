mkdir -p /root/.kube 
cp -i /etc/kubernetes/admin.conf /root/.kube/config
chown 0:0 /root/.kube/config
