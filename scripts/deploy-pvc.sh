#!/bin/bash

kubectl apply -f dev-pb/dev-pb-pv.yaml 
kubectl apply -f gitea/gitea-pvc.yaml
kubectl apply -f ibga/ibga-pvc.yaml 
kubectl apply -f ide/ide-pvc.yaml
kubectl apply -f live-ide/live-ide-pvc.yaml
kubectl apply -f qbittorrent/qbittorrent-pvc.yaml
kubectl apply -f ollama/ollama-pvc.yaml
kubectl apply -f activepieces/activepieces-pvc.yaml
kubectl apply -f pihole/pihole-pvc.yaml
kubectl apply -f wireguard/wireguard-pvc.yaml
kubectl apply -f jackett/jackett-pvc.yaml
