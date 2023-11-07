output "state_bucket_arn" {
  description = "Arn of the terraform aws state bucket."
  value       = module.state_bucket.bucket_arn
}

output "state_bucket_name" {
  description = "Name of the terraform aws state bucket."
  value       = module.state_bucket.bucket_name
}

output "state_lock_table_arn" {
  description = "Arn of the state lock table."
  value       = aws_dynamodb_table.state_lock_table.arn
}

output "state_lock_table_name" {
  description = "Name of the state lock table."
  value       = var.state_lock_table_name
}
