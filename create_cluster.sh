#!/usr/bin/env bash

# create a low cost cluster
eksctl create cluster --name=Test --region=us-east-1 --instance-types=t2.micro

# create an own namespace for the game
kubectl create namespace game

