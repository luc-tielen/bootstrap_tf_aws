#!/bin/bash

set -e

read -p "Enter environment name: " ENVIRONMENT
tofu workspace new ${ENVIRONMENT}
tofu init
echo "You're now ready to bootstrap your TF state for the ${ENVIRONMENT} environment!"
