# Terraform state bucket
module "state_bucket" {
  source             = "flagscript/flagscript-s3-bucket/aws"
  version            = "0.1.0"
  application_id     = var.application_id
  bucket_name_prefix = "terraform"
  bucket_name_suffix = "state"
}

# Terraform state lock table
resource "aws_dynamodb_table" "state_lock_table" {
  billing_mode                = "PROVISIONED"
  deletion_protection_enabled = true
  hash_key                    = "LockID"
  name                        = var.state_lock_table_name
  read_capacity               = 20
  write_capacity              = 20
  tags = merge(
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
    enabled = false # AWS Managed Key
  }
}
