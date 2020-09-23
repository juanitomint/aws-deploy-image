FROM python:3-alpine
# CONSUME BUILD ARGS FOR TRACE
ARG VCS_REF
ARG BUILD_DATE
ARG GIT_USER
ARG GIT_USER_EMAIL
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.git_user=$GIT_USER \
      org.label-schema.git_user_email=$GIT_USER_EMAIL
#get Arguments for building different images
ARG AWS_ACCESS_KEY_ID 
ARG AWS_SECRET_ACCESS_KEY 
ARG AWS_DEFAULT_REGION
ARG KUBE_ENVIRONMENT 

# ENVIRONMENT VARIABLES available at container runtime
ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID 
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION
ENV KUBE_ENVIRONMENT $KUBE_ENVIRONMENT
# prequisites

RUN apk --no-cache --update add  ncurses curl openssl bash jq git

# upgrade pip
RUN pip install --upgrade pip
# install yq for parsing yaml files (requires jq)
RUN pip install --upgrade yq
# aws-cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip 
# && ./aws/install -b /usr/local/bin

# aws-iam-authenticator
RUN curl -o /usr/local/bin/aws-iam-authenticator "https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator" &&\
    chmod +x /usr/local/bin/aws-iam-authenticator

# install kubectl
RUN curl -o  /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" &&\
    chmod +x /usr/local/bin/kubectl 
    
#  install HELM
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


# # update cluster profile
# RUN if [ ! -z $KUBE_ENVIRONMENT ]; then aws eks update-kubeconfig --name $KUBE_ENVIRONMENT --kubeconfig $HOME/.kube/config --verbose; fi





# command to start application
CMD [ "sh","-l"]