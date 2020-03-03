mv /etc/kubernetes/manifests/kube-apiserver.yaml .
sleep 3
mv kube-apiserver.yaml /etc/kubernetes/manifests/
sleep 3

mv /etc/kubernetes/manifests/kube-controller-manager.yaml .
sleep 3
mv kube-controller-manager.yaml /etc/kubernetes/manifests/
sleep 3

mv /etc/kubernetes/manifests/kube-scheduler.yaml .
sleep 3
mv kube-scheduler.yaml /etc/kubernetes/manifests/
sleep 3


systemctl restart kubelet

