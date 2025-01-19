# bootstrap_tf_aws

Bootstrapping code for terraform so other projects can store terraform state in
AWS. It sets up a S3 bucket and DynamoDB for storing your state in per account,
per "environment" (staging/production/...).

## Getting started

Run the following commands **once** per account:

```bash
cd infra/
# This will ask for the "environment" name.
make init
make plan
make deploy
```

The `init.sh` script will create a new terraform workspace with the environment
name. The `plan.sh` and `deploy.sh` scripts can then make use of the current
workspace name / environment to deploy the infrastructure in AWS.

Now you can start storing your terraform state of other projects (not this one!)
in S3/DynamoDB. You can do this with the following block of code:

```hcl
terraform {
  backend "s3" {
    key            = "state/terraform.tfstate"
    region         = "us-east-1"  # choose whatever region is most appropriate for you
    encrypt        = true
  }
}
```

Next, create one `backend-${ENVIRONMENT}.hcl` per environment, and put the
output of `make output` in each file. After this, run
`terraform init -backend-config=backend-${ENVIRONMENT}.hcl`.

## Destroying the infra

**IMPORTANT**: This will destroy the bucket and DynamoDB, which might contain your
entire terraform state. Only do this if you have the state backed up somewhere
else or no longer need it!

First, find the lines in `main.tf` that says `prevent_destroy = true` and change
them to `false`. Then run the following command:

```bash
cd infra/
make destroy
```
