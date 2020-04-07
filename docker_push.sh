#!/bin/bash
	
# get variables form gitlab-ci or locals
source docker_getenv.sh

echo "REGISTRY is: $REGISTRY"
echo "REPOSITORY is: $REPOSITORY"
echo "VERSION is: $VERSION"

#get token
`aws ecr get-login --no-include-email`

docker push $REGISTRY/$REPOSITORY:$VERSION
set +x