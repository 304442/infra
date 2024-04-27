#!/bin/bash

# Install k3s and configure kubeconfig
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode=644

# Check k3s service status
systemctl status k3s

# Check kubectl version
/usr/local/bin/kubectl version

# Check current PATH
echo $PATH

# Add /usr/local/bin to PATH if it's not already in it
if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
    export PATH=$PATH:/usr/local/bin
fi

# Check kubectl version again after updating PATH
kubectl version

# Get nodes in the cluster
kubectl get nodes

# Get namespaces in the cluster
kubectl get ns
