output "bucket" {
  value = aws_s3_bucket.tf_state_bucket.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.tf_lock.id
}
