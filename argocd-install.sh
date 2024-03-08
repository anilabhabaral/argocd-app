#!/bin/bash

echo "*******************Installing ArgoCD**********************"
echo -e '\n'

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

sleep 30

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

sleep 10

echo -e '\n'
echo "*********************** Initial Password ******************************"
argocd admin initial-password -n argocd
echo "*********************** Initial Password ******************************"
echo -e '\n'


echo "access ArgoCD dashboard: https://localhost:8080/"
echo -e '\n'


kubectl port-forward svc/argocd-server -n argocd 8080:443

