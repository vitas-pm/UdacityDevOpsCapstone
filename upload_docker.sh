#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=vitaspm/price_predictor
version=v0.1

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
cat docker_pw.txt | docker login --username vitaspm --password-stdin
docker tag price_predictor:latest $dockerpath:$version

# Step 3:
# Push image to a docker repository
docker image push $dockerpath:$version