echo 'Insert master ip address'
read ipaddr
kubeadm init --pod-network-cidr=10.10.0.0/16 --apiserver-advertise-address=$ipaddr --cri-socket=/var/run/containerd/containerd.sock
