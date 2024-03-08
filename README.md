## ArgoCD installation
- To install argocd in loacal k8s cluster(like K3D, minikube, kind etc) follow this doc: https://argo-cd.readthedocs.io/en/stable/getting_started/
- This installation process can be automated by this script `argocd-install.sh`. To run the script follow the below commands
```
wget https://raw.githubusercontent.com/anilabhabaral/argocd-app/main/argocd-install.sh
chmod 755 argocd-install.sh
```
  
 ```
./argocd-install.sh
  ```
- To install argocd using OpenShift GitOps Operator in OpenShift follow link: https://github.com/anilabhabaral/hello-cicd-argocd-jboss?tab=readme-ov-file#argocdcd

## For raw yaml manifest like deployment, service and route

1. deployment.yaml
2. route.yaml
3. service.yaml

- The directory needs to mentioned in ArgoCD application:
```
yamls/
```
- ArgoCD application:
```
project: default
source:
  repoURL: 'https://github.com/anilabhabaral/argocd-app.git'
  path: yamls
  targetRevision: HEAD
destination:
  server: 'https://kubernetes.default.svc'
  namespace: test-helm-abaral
syncPolicy:
  automated:
    prune: true
    selfHeal: true
```

## Helm Chart
- For Helm chart use this directory in ArgoCD application:
```
helloworld-helm-chart
```

- ArgoCD application:
```
project: default
source:
  repoURL: 'https://github.com/anilabhabaral/argocd-app.git'
  path: helloworld-helm-chart
  targetRevision: HEAD
destination:
  server: 'https://kubernetes.default.svc'
  namespace: test-helm-abaral
syncPolicy:
  automated:
    prune: true
    selfHeal: true
```
