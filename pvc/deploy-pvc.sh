#!/bin/bash

kubectl apply -f dev-pb-pv.yaml 
kubectl apply -f gitea-pvc.yaml
kubectl apply -f ibga-pvc.yaml 
kubectl apply -f ide-pvc.yaml
kubectl apply -f live-ide-pvc.yaml
kubectl apply -f qbittorrent-pvc.yaml
kubectl apply -f ollama-pvc.yaml
