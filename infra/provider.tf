terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  required_version = ">= 1.3.9"
}

provider "aws" {
  region                   = "eu-west-1"
}
