# Load Test

Login:

```
argocd login argo-cd-kubecon.apps.argoproj.io:443 --username admin
```

Create and sync apps:

```
argocd app create load-test \
    --repo https://github.com/gitops-workshop/load-test.git \
    --path apps/app-of-apps \
    --revision alexec \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default \
    --upsert
    --auto-sync
```

### Build

To build templates:

```
make
```

### Clean Up

```
argocd app delete load-test
```