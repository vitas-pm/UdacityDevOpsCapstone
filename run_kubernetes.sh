#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=docker.io/vitaspm/browser-game
version=$1

# Assuming the Kubernetes cluster is ready
kubectl get nodes
# Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl create deploy browser-game --image=${dockerpath}:${version} --port=80 --namespace=game
# Port forward
kubectl expose deployment browser-game --type=LoadBalancer --port=80 --target-port=80 --namespace=game
# See the status
kubectl get deploy,rs,svc,pods

