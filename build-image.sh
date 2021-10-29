#!/bin/bash

export MGKIT_VERSION=0.5.8

echo Building MGKit $MGKIT_VERSION

docker build --build-arg MGKIT_VERSION=$MGKIT_VERSION -t frubino/mgkit:$MGKIT_VERSION .

