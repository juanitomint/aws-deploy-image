#!/bin/bash
	
# get variables form gitlab-ci or locals
source docker_getenv.sh


docker build \
        --build-arg VCS_REF=`git rev-parse --short HEAD` \
        --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
        --build-arg GIT_USER="$GIT_USER" \
        --build-arg GIT_USER_EMAIL="$GIT_USER_EMAIL"  \
        --build-arg  AWS_ACCESS_KEY_ID="" \
        --build-arg  AWS_SECRET_ACCESS_KEY="" \
        --build-arg  AWS_DEFAULT_REGION="us-east-1" \
        --build-arg  KUBE_ENVIRONMENT=""\
        -t $REGISTRY/$REPOSITORY:$VERSION . | tee build.log
set +x