data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "tf-state-${var.environment}-${local.account_id}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_ownership_controls" "tf_state_ownership_controls" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  bucket     = aws_s3_bucket.tf_state_bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.tf_state_ownership_controls]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption_config" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning_config" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "tf_state_bucket_lifecycle_config" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    id     = "archive-noncurrent-versions"
    status = "Enabled"

    filter {} # apply to all objects

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = 365
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-lock-${var.environment}-${local.account_id}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}
