#!/bin/bash
# set -x
# check version
if [ -z "$VERSION" ]
then
      # check if in gitlab ci build context

        if [ -z "$CI_COMMIT_REF_NAME" ]
          then 
           # get version from branch
            VERSION=`git rev-parse --abbrev-ref HEAD`
          else
            VERSION="$CI_COMMIT_REF_NAME"
        fi
fi

# rectify $VERSION name master to tools
if [ "$VERSION" == "master" ]
 then
      VERSION="tools";
fi

# check repository
if [ -z "$REPOSITORY" ]
then
      REPOSITORY="automation/gitlab-runners"
fi

# check registry if not present then set to gitlab ECR
if [ -z "$REGISTRY" ]
then
      REGISTRY="juanitomint"
fi

# check git user
if [ -z "$GITLAB_USER_LOGIN"]
      then
            GIT_USER=`git config user.name`
      else
            GIT_USER=$GITLAB_USER_LOGIN
fi
# check git user_email
if [ -z "$GITLAB_USER_EMAIL"]
      then
            GIT_USER_EMAIL=`git config user.email`
      else
            GIT_USER_EMAIL=$GITLAB_USER_EMAIL
fi
# echo result
echo -e "\e[1;34m"
echo "REGISTRY is: $REGISTRY"
echo "REPOSITORY is: $REPOSITORY"
echo "VERSION is: $VERSION"
echo "GIT_USER is: $GIT_USER"
echo "GIT_USER_EMAIL: $GIT_USER_EMAIL"
echo -e "\e[0m \n\n\n"
set +x