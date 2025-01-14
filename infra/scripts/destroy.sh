#!/bin/bash

set -e

echo "You are about to destroy the infra for managing your TF state."
read -p "Are you sure you want to do this? This action cannot be undone! (yes/no)" ANSWER

if [[ "${ANSWER}" != "yes" ]]; then
  echo "Will not destroy infra, aborting."
  exit 0
fi

echo "Destroying infrastructure.."
ENVIRONMENT=$(terraform workspace show)
terraform workspace select ${ENVIRONMENT}
terraform destroy -var="environment=${ENVIRONMENT}"
