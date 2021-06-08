#!/bin/bash

docker build -t gipert/remage-base:slim -f Dockerfile.slim .
docker push gipert/remage-base:slim &

docker build -t gipert/remage-base:G4.10.7 -f Dockerfile.G4-10-7 .
docker push gipert/remage-base:G4.10.7 &

docker build -t gipert/remage-base:latest .
docker push gipert/remage-base:latest
