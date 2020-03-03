
    #--server=${KUBE_APISERVER} \
# admin set-cluster
kubectl config set-cluster kubernetes \
    --certificate-authority=pki/ca.crt \
    --embed-certs=true \
    --server="172.16.244.51:6443" \
    --kubeconfig=../admin.conf
 
# admin set-credentials
kubectl config set-credentials kubernetes-admin \
    --client-certificate=admin.pem \
    --client-key=admin-key.pem \
    --embed-certs=true \
    --kubeconfig=../admin.conf
 
# admin set-context
kubectl config set-context kubernetes-admin@kubernetes \
    --cluster=kubernetes \
    --user=kubernetes-admin \
    --kubeconfig=../admin.conf
 
# admin set default context
kubectl config use-context kubernetes-admin@kubernetes \
    --kubeconfig=../admin.conf
