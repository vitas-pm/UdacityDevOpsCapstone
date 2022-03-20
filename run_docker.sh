#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
echo building
docker build -v /var/run/docker.sh:/var/run/docker.sh -v /var/run/docker.sock:/var/run/docker.sock --tag=browser-game .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
# docker run -p 80:80 browser-game
