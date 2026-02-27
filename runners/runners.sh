#! /bin/bash
docker run -it --rm \
    --name gitlab-runner \
    -v ./:/etc/gitlab-runner/ \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:alpine3.21-v18.8.0