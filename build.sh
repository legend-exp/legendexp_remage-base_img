#!/bin/bash

for flavor in {slim,G4-11-2,G4-11-3,latest,stable}; do
    docker_tag=$(echo $flavor | sed 's|-|.|g')
    docker build --pull --rm -t gipert/remage-base:$docker_tag -f Dockerfile.$flavor . && \
        docker push gipert/remage-base:$docker_tag
done

# special images, produced only for latest version
flavor="G4-11-3"
docker_tag=$(echo $flavor | sed 's|-|.|g')

docker build --pull --rm --build-arg CMAKE_BUILD_TYPE="RelWithDebInfo" \
             -t gipert/remage-base:${docker_tag}-debuginfo -f Dockerfile.$flavor . && \
    docker push gipert/remage-base:$docker_tag-debuginfo

docker build --pull --rm --build-arg VECGEOM_VERSION="master" \
             --build-arg GEANT4_USE_USOLIDS="ON" \
             -t gipert/remage-base:${docker_tag}-vecgeom-experimental -f Dockerfile.$flavor . && \
    docker push gipert/remage-base:$docker_tag-vecgeom-experimental
