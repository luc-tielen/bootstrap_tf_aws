#!/bin/bash

set -e

ENVIRONMENT=$(terraform workspace show)
terraform workspace select ${ENVIRONMENT}
terraform plan -var="environment=${ENVIRONMENT}"
