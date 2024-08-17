# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
variable "state_lock_table_name" {
  default     = "terraform-state-lock"
  description = "Name for the dynamo state table."
  type        = string
}

variable "provisioned_read_capacity" {
  default     = 20
  description = "Read capacity when in provisioned mode."
  type        = number
}

variable "provisioned_write_capacity" {
  default     = 20
  description = "Read capacity when in provisioned mode."
  type        = number
}

variable "use_pay_per_request" {
  default     = true
  description = "Whether or not to use dynamo pay per request mode. Setting this to false will use provisioned billing mode."
}
