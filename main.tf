# Terraform state bucket
module "state_bucket" {
  source             = "flagscript/flagscript-s3-bucket/aws"
  version            = "1.0.0"
  bucket_name_prefix = "terraform"
  bucket_name_suffix = "state"
  # use_standard_bucket_policy = false
}

# Terraform state lock table
resource "aws_dynamodb_table" "state_lock_table" {
  billing_mode                = var.use_pay_per_request ? "PAY_PER_REQUEST" : "PROVISIONED"
  deletion_protection_enabled = true
  hash_key                    = "LockID"
  name                        = var.state_lock_table_named
  read_capacity               = var.use_pay_per_request ? 20 : 20
  write_capacity              = var.use_pay_per_request ? 20 : 20
  tags = merge(
    local.common_tags,
    {
      Name = var.state_lock_table_name
    }
  )

  attribute {
    name = "LockID"
    type = "S"
  }
  point_in_time_recovery {
    enabled = true
  }
  server_side_encryption {
    enabled = true # AWS Managed Key
  }
}
