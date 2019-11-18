# Load Test

Login:

```
argocd login argo-cd-kubecon.apps.argoproj.io:443 --username admin
```

Create and sync apps:

```
./run.sh
```

### Clean Up

```
kubectl delete app -l load-test
```