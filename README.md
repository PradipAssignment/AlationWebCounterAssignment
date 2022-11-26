# AlationWebCounterAssignment

This is Alation WebCounter Assignment written in python

Step 1 :

Install Jenkins and setup docker build image CI

Jenkins Credential :

http://34.100.167.230:8080/
Username : pradip
Password  : Pradip


Step 2: 

install git,terraform and create server through terraform script.

git clone git@github.com:PradipAssignment/AlationWebCounterAssignment.git
terraform init
terraform plan
terraform apply

ssh the server using password less ssh (putty winscp mobaxterm ssh client) Note : key attched in document file.

nohup sudo minikube start –driver=docker –force &
tail -f nohup.out (wait till servr is up and running)
sudo minikube status
sudo kubectl apply -f alationwebcounterreplicset.yml
sudo kubectl create -f alationloadbalancer.yml
sudo kubectl get pod -o wide

