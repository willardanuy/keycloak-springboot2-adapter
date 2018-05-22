#!/usr/bin/env bash

AWS_ECR_ADDR="279726348302.dkr.ecr.us-east-1.amazonaws.com"

IMAGE_BASE="yh-product-services"

AWS_ECR_IMAGE="${AWS_ECR_ADDR}/${IMAGE_BASE}"
LOCAL_IMAGE="${IMAGE_BASE}"

VERSION="$(git tag | tail -n 1)"

echo "TAGGING:"
echo ${AWS_ECR_IMAGE}:latest
echo ${AWS_ECR_IMAGE}:${VERSION}

docker image tag ${LOCAL_IMAGE}:latest ${AWS_ECR_IMAGE}:latest \
&& docker image tag ${LOCAL_IMAGE}:latest ${AWS_ECR_IMAGE}:${VERSION} \
&& echo "TAGGED:" \
&& docker image ls --filter "reference=${LOCAL_IMAGE}" \
&& docker image ls --filter "reference=${AWS_ECR_IMAGE}" \
&& eval $(aws ecr get-login --no-include-email --region us-east-1) \
&& docker image push ${AWS_ECR_IMAGE}:${VERSION} \
&& docker image push ${AWS_ECR_IMAGE}:latest