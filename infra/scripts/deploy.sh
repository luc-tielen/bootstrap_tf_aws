#!/bin/bash

set -e

ENVIRONMENT=$(terraform workspace show)
terraform workspace select ${ENVIRONMENT}
terraform deploy -var="environment=${ENVIRONMENT}"
