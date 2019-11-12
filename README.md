# Load Test

Create 500 apps.

```
argocd app create load-test \
    --repo https://github.com/gitops-workshop/load-test.git \
    --path apps/app-of-apps \
    --revision HEAD \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
argocd app sync load-test  
argocd app sync -l app.kubernetes.io/instance=load-test
```

### Clean-up

```
argocd app delete load-test
```