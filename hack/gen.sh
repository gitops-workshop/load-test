#!/bin/sh
set -eu

mkdir -p apps/app-of-apps/templates

for i in $(seq 1 500); do
  echo "$i/500"
  export user=user$i
  export app=app$i
  rm -Rf apps/$app
  cp -R templates/app apps/$app
  cd apps/$app
  kustomize edit set nameprefix $user-
  cd ../..
  envsubst < templates/app.yaml > apps/app-of-apps/templates/$app.yaml
done