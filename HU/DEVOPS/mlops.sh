sudo apt install curl
curl -LO https://dl.k8s.io/release/v1.21.14/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo kubectl version

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo apt install docker.io
sudo usermod -aG docker $USER && newgrp docker

minikube start --cpus 6 --memory 10240 --disk-size=50g --kubernetes-version 1.21.14

set -e

KF_PATH="$HOME/.kubeflow"
rm -fr $KF_PATH
mkdir -p $KF_PATH
cd $KF_PATH
wget https://github.com/kubeflow/kfctl/releases/download/v1.2.0/kfctl_v1.2.0-0-gbc038f9_linux.tar.gz

tar -xvf kfctl_v1.2.0-0-gbc038f9_linux.tar.gz 

export PATH=$PATH:$KF_PATH
export KF_NAME=my-kubeflow
export BASE_DIR=$KF_PATH
export KF_DIR=${BASE_DIR}/${KF_NAME}
export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/v1.2-branch/kfdef/kfctl_k8s_istio.v1.2.0.yaml"

mkdir -p ${KF_DIR}
cd ${KF_DIR}
kfctl apply -V -f ${CONFIG_URI}

kubectl port-forward --address 0.0.0.0 -n istio-system svc/istio-ingressgateway 8080:80

watch kubectl get pod -n kubeflow