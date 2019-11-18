#!/bin/bash

function create {
    i=$1
    argocd app create -f - << EOF
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app${i}
  labels:
    load-test: 'true'
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: default
    server: https://kubernetes.default.svc
  project: default
  source:
    kustomize:
      namePrefix: app${i}
    path: kustomize-guestbook
    repoURL: https://github.com/argoproj/argocd-example-apps
    targetRevision: HEAD
  syncPolicy:
    automated: {}
EOF
}

for i in {1..200}
do
   create $i &
done

wait
