#!/bin/bash

docker build --pull --rm -t gipert/remage-base:slim -f Dockerfile.slim .
docker push gipert/remage-base:slim &

# docker build --pull --rm -t gipert/remage-base:G4.10.7 -f Dockerfile.G4-10-7 .
# docker push gipert/remage-base:G4.10.7 &

# docker build --pull --rm -t gipert/remage-base:G4.11.0 -f Dockerfile.G4-11-0 .
# docker push gipert/remage-base:G4.11.0 &

# docker build --pull --rm -t gipert/remage-base:G4.11.1 -f Dockerfile.G4-11-1 .
# docker push gipert/remage-base:G4.11.1 &

docker build --pull --rm -t gipert/remage-base:G4.11.2 -f Dockerfile.G4-11-2 .
docker push gipert/remage-base:G4.11.2 &

docker build --pull --rm --build-arg CMAKE_BUILD_TYPE="RelWithDebInfo" \
             -t gipert/remage-base:G4.11.2-debuginfo -f Dockerfile.G4-11-2 .

docker build --pull --rm -t gipert/remage-base:latest .
docker push gipert/remage-base:latest

cd remage && ./build.sh
