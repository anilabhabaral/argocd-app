Create the namespeces/projects before creating this argocd application:
```
oc apply -f https://raw.githubusercontent.com/anilabhabaral/argocd-app/refs/heads/main/app-of-apps/ns-app1.yaml
oc apply -f https://raw.githubusercontent.com/anilabhabaral/argocd-app/refs/heads/main/app-of-apps/ns-app2.yaml
```

Argocd application for app of apps
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: test-app-of-apps
spec:
  destination:
    name: ''
    namespace: ''
    server: https://kubernetes.default.svc
  source:
    path: app-of-apps
    repoURL: https://github.com/anilabhabaral/argocd-app/
    targetRevision: HEAD
  sources: []
  project: default
  syncPolicy:
    automated:
      prune: false
      selfHeal: false
```
