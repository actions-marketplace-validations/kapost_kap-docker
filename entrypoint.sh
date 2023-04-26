#!/bin/bash

# This script assumes you're building the docker image and using the same image tag for the repo that it will be pushed to
# All variables must have a value

# PULL_REPO is the source repo - PULL_TAG is the source image tag
if [ "$PULL" == true ]; then
    docker pull $PULL_REPO:$PULL_TAG
fi

# PUSH_REPO is the repository where the built image will be pushed to
if [ "$BUILD" == true ]; then
    docker build -t $REPO:$IMAGE_TAG .
fi

# PUSH_REPO is the repository where the built image will be pushed to - assumes the same image tag used in the build if BUILD and PUSH are both true
if [ "$PUSH" == true ]; then
    docker push $REPO:$IMAGE_TAG
fi
