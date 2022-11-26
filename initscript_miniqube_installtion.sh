#!/bin/bash
# Install miniqube and kubectl
cd /home/rsa-key-20221123
sudo apt update -y
sudo snap install docker 
sudo apt install docker.io -y
sudo systemctl enable docker
sudo apt install -y curl wget apt-transport-https
sudo wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
sudo minikube version
sudo snap install kubectl --classic
nohup sudo minikube start --driver=docker force &
sudo minikube addons enable dashboard
sudo minikube addons enable  metrics-server
sudo minikube addons enable ingress
sudo minikube dashboard
