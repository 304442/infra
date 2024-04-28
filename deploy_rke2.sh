#!/bin/bash

curl -sfL https://get.rke2.io |INSTALL_RKE2_TYPE=server  sh - 
systemctl enable rke2-server.service
systemctl start rke2-server.service

# Check if PATH is not already present in the current PATH
if [[ ":$PATH:" != *":/var/lib/rancher/rke2/bin:"* ]]; then
    export PATH="$PATH:/var/lib/rancher/rke2/bin"
fi

# Check if KUBECONFIG is not already set
if [ -z "$KUBECONFIG" ]; then
    export KUBECONFIG="/etc/rancher/rke2/rke2.yaml"
fi

if ! cat "$HOME/.bashrc" | grep -q "export PATH=.*:/var/lib/rancher/rke2/bin.*"; then
    echo "export PATH=$PATH:/var/lib/rancher/rke2/bin" >> "$HOME/.bashrc"
fi


if ! grep -qxF "export KUBECONFIG=/etc/rancher/rke2/rke2.yaml" "$HOME/.bashrc"; then
    echo "export KUBECONFIG=/etc/rancher/rke2/rke2.yaml" >> "$HOME/.bashrc"
fi

source ~/.bashrc

kubectl version
kubectl get nodes
