#!/bin/bash

# Check if domainName is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <domainName>"
  exit 1
fi

DOMAIN_NAME=$1

# setup helm and helmfile
chmod u+x ./scripts/setup_helm.sh
./scripts/setup_helm.sh

# setup argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# setup cert issuers
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.yaml
kubectl apply -f cert-issuers/prod_issuer.yaml

# setup pv and pvc
chmod u+x ./scripts/deploy-pvc.sh
./scripts/deploy-pvc.sh

# setup and run application in argocd
chmod u+x ./scripts/deploy_argocd_apps.sh
./scripts/deploy_argocd_apps.sh

# setup ingress for services
helm install custom-ingress ./custom-ingress --set domainName=${DOMAIN_NAME}
