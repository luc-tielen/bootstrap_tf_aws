#!/bin/bash

set -e

read -p "Enter environment name: " ENVIRONMENT
terraform workspace new ${ENVIRONMENT}
terraform init
echo "You're now ready to bootstrap your TF state for the ${ENVIRONMENT} environment!"
