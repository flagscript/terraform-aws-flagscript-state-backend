# Terraform state bucket
module "state_bucket" {
  providers = {
    aws = aws.state
  }
  source             = "flagscript/flagscript-s3-bucket/aws"
  version            = "2.3.0"
  bucket_name_prefix = "terraform"
  bucket_name_suffix = "state"
}

module "replication_bucket" {
  providers = {
    aws = aws.replication
  }
  source             = "flagscript/flagscript-s3-bucket/aws"
  version            = "2.3.0"
  bucket_name_prefix = "terraform"
  bucket_name_suffix = "state"
}

module "flagscript-s3-bucket_s3-replication" {
  providers = {
    aws.source      = aws.state
    aws.destination = aws.replication
  }
  source                   = "flagscript/flagscript-s3-bucket/aws//modules/s3-replication"
  version                  = "2.3.0"
  source_bucket_name       = module.state_bucket.bucket_name
  destination_bucket_name  = module.replication_bucket.bucket_name
  replicate_delete_markers = false
}

# Terraform state lock table
resource "aws_dynamodb_table" "state_lock_table" {
  provider                    = aws.state
  billing_mode                = var.use_pay_per_request ? "PAY_PER_REQUEST" : "PROVISIONED"
  deletion_protection_enabled = true
  hash_key                    = "LockID"
  name                        = var.state_lock_table_name
  read_capacity               = var.use_pay_per_request ? null : var.provisioned_read_capacity
  write_capacity              = var.use_pay_per_request ? null : var.provisioned_write_capacity
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
