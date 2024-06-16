#!/bin/bash

kubectl apply -f argocd/activepieces-app.yaml   
kubectl apply -f argocd/etherpad-app.yaml  
kubectl apply -f argocd/ibga-app.yaml        
kubectl apply -f argocd/pinnwand-app.yaml    
kubectl apply -f argocd/vaultwarden-app.yaml
kubectl apply -f argocd/argocd-deployment.yaml  
kubectl apply -f argocd/flame-app.yaml     
kubectl apply -f argocd/llama-app.yaml       
kubectl apply -f argocd/prometheus-app.yaml  
kubectl apply -f argocd/wirehole-app.yaml
kubectl apply -f argocd/browserless-app.yaml    
kubectl apply -f argocd/gitea-app.yaml     
kubectl apply -f argocd/neko-app.yaml        
kubectl apply -f argocd/syncthing-app.yaml
kubectl apply -f argocd/code-server.yaml        
kubectl apply -f argocd/glances-app.yaml  
kubectl apply -f argocd/nodered-app.yaml     
kubectl apply -f argocd/torrent-app.yaml
kubectl apply -f argocd/error-page-app.yaml     
kubectl apply -f argocd/grafana-app.yaml   
kubectl apply -f argocd/photoprism-app.yaml  
kubectl apply -f argocd/umami-app.yaml
