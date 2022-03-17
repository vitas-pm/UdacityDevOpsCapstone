#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=vitaspm/price_predictor
version=v0.1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run price-predictor --image=$dockerpath:$version --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/price-predictor 8000:80

