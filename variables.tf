# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
variable "application_id" {
  description = "Application Id"
  type        = string
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "state_lock_table_name" {
  default     = "terraform-state-lock"
  description = "Name for the dynamo state table."
  type        = string
}
