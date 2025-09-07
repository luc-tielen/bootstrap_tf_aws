#!/bin/bash

set -e

ENVIRONMENT=$(tofu workspace show)
tofu workspace select ${ENVIRONMENT}
tofu plan -var="environment=${ENVIRONMENT}"
