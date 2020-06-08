echo "============kubernetes version=================="
kubectl version
echo ""

echo "============apiserver.crt======================"
openssl x509 -in /etc/kubernetes/pki/apiserver.crt -noout -text| grep Not
echo ""


echo "============kubelet server.crt==========================="
sc=`ps -ef |grep kubelet |grep RotateKubeletServerCertificate`
if [ "X${sc}" == "X" ];then
	echo "kubelet未开启kubelet server证书轮转"
else
	echo $sc
fi
ctlsc=`cat /etc/kubernetes/manifests/kube-controller-manager.yaml |grep RotateKubeletServerCertificate`
if [ "X${ctlsc}" == "X" ];then
	echo "controller manager未开启kubelet server证书轮转"
else
	echo $ctlsc
fi



kubeadm config view > /tmp/kube-config.yaml
if [ $? -ne 0 ];then
	echo "生成k8s集群配置失败"
	exit 1
else 
	cat /tmp/kube-config.yaml
fi

kubeadm alpha certs renew apiserver --config=/tmp/kube-config.yaml
if [ $? -ne 0 ];then
	echo "更新apiserver证书失败"
	exit 2
else
	echo "查看更新后的apiserver.crt证书年限"
	openssl x509 -in /etc/kubernetes/pki/apiserver.crt -noout -text| grep Not
fi

echo "你需要重启apiserver pod"
