#!/bin/bash

# Description: updates the local image
# Usage: ./update.sh

# Loading variables from .env file
vars=$(cat ./.env)
export $vars

# Pulling latest official image
docker image pull "$image:latest"

# Rebuilding the local image
docker image build \
    --build-arg image="$image" \
    -t "$image:$tag" .
