# docker deploy image

This image contains all the tools needed for deploying to an Kubernetes cluster EKS version
you can easily adapt it to any other flavor




![Build Status](https://gitlab.naranja.dev/devops/gitlab/aws-deploy-img/badges/master/build.svg)
# images builded:


## Configuration 

Set this CI/CD environment Variables in  or doocker_getenv.sh


* REGISTRY
* REPOSITORY
* VERSION

ie:
docker push $REGISTRY/$REPOSITORY:$VERSION

For creating different images or at runtime
* ENV AWS_ACCESS_KEY_ID 
* ENV AWS_SECRET_ACCESS_KEY
* ENV AWS_DEFAULT_REGION 
* ENV KUBE_ENVIRONMENT 

## Release process

After the build the images are uploaded to registry

### NOTE!: 
Don't branch from master as this is the base image for building the others

ie: branch from ssff-develop-eks and customize from there


## Requirements

Docker installed

## Features
3 stages

build: build docker image

get token:  get a fresh token from registry (Amazon ECR service)

publish



## Author / Maintainer

- 2019 - now    : Borda Juan Ignacio

## License

This code is distributed under the MIT license, see the [LICENSE](LICENSE) file.
