#!/bin/bash

REPO_NAME=arsdehnel-blog-dev-env
AWS_ACCT_ID=799515160920
AWS_PROFILE_NAME=arsdehnel

# get the ECR credentials updated in our session
eval $(AWS_DEFAULT_PROFILE=$AWS_PROFILE_NAME aws ecr get-login --region us-west-2)

docker build -t $REPO_NAME:latest .
docker tag $REPO_NAME $AWS_ACCT_ID.dkr.ecr.us-west-2.amazonaws.com/$REPO_NAME:latest
docker push $AWS_ACCT_ID.dkr.ecr.us-west-2.amazonaws.com/$REPO_NAME:latest