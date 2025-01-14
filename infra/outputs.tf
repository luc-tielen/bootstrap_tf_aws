output "terraform_state_bucket" {
  value = aws_s3_bucket.tf_state_bucket.bucket
}

output "terraform_state_dynamodb" {
  value = aws_dynamodb_table.tf_lock.id
}
