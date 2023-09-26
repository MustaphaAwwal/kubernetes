#!/bin/bash

CLUSTER_NAME="awwal"
KUBECONFIG_PATH="$HOME/.kube/$CLUSTER_NAME-config"

kind create --config kind-config.yaml cluster --name "$CLUSTER_NAME"

# Generate kubeconfig for the cluster
kubectl config use-context "$CLUSTER_NAME"

# Save the kubeconfig to the specified location
kubectl config view --minify --flatten > "$KUBECONFIG_PATH"

echo "KIND cluster '$CLUSTER_NAME' is created."
echo "Kubeconfig saved to '$KUBECONFIG_PATH'."
