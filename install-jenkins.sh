#!/bin/bash

## Helm
helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm upgrade --install \
    jenkins jenkinsci/jenkins \
    --namespace jenkins \
    --create-namespace \
    --values jenkins-infra/jenkins-values.yaml \
    --wait
