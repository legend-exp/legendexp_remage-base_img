#!/bin/bash

export BUILDKIT_STEP_LOG_MAX_SIZE=1073741824  # 1 GB
n_threads=30

for flavor in {G4-11-4,latest,G4-11-3,stable,slim}; do
    docker_tag=$(echo $flavor | sed 's|-|.|g')
    docker build \
        --progress plain \
        --pull --rm \
        --build-arg N_THREADS=$n_threads \
        -t legendexp/remage-base:$docker_tag \
        -f Dockerfile.$flavor . || exit 1

    docker push legendexp/remage-base:$docker_tag
done

# special images, produced only for latest version
flavor="G4-11-4"
docker_tag=$(echo $flavor | sed 's|-|.|g')

docker build \
    --progress plain \
    --pull --rm \
    --build-arg CMAKE_BUILD_TYPE="RelWithDebInfo" \
    --build-arg N_THREADS=$n_threads \
    -t legendexp/remage-base:${docker_tag}-debuginfo \
    -f Dockerfile.$flavor . || exit 1

docker push legendexp/remage-base:$docker_tag-debuginfo

# docker build --pull --rm --build-arg VECGEOM_VERSION="master" \
#              --build-arg GEANT4_USE_USOLIDS="ON" \
#              -t legendexp/remage-base:${docker_tag}-vecgeom-experimental -f Dockerfile.$flavor . && \
#     docker push legendexp/remage-base:$docker_tag-vecgeom-experimental
