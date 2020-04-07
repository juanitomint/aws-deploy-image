#!/bin/bash
# get variables form gitlab-ci or locals
source docker_getenv.sh

echo "REGISTRY is: $REGISTRY"
echo "REPOSITORY is: $REPOSITORY"
echo "VERSION is: $VERSION"


docker run -it -p 3000:3000 --rm $REGISTRY/$REPOSITORY:$VERSION bash