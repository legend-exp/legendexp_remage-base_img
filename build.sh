#!/bin/bash

for flavor in {slim,G4-11-2,G4-11-3,latest,stable}; do
    docker_tag=$(echo $flavor | sed 's|-|.|g')
    docker build --pull --rm -t gipert/remage-base:$docker_tag -f Dockerfile.$flavor . && \
        docker push gipert/remage-base:$docker_tag
done

docker build --pull --rm --build-arg CMAKE_BUILD_TYPE="RelWithDebInfo" \
             -t gipert/remage-base:G4.11.3-debuginfo -f Dockerfile.G4-11-3 .

docker build --pull --rm --build-arg VECGEOM_VERSION="master" \
             --build-arg GEANT4_USE_USOLIDS="ON" \
             -t gipert/remage-base:G4.11.3-vecgeom-experimental -f Dockerfile.G4-11-3 .
