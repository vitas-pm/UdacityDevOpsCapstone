#!/usr/bin/env bash

NEWVERSION="$1"

kubectl set image deployment/browser-game browser-game=docker.io/vitaspm/browser-game:$NEWVERSION
