variable "compartment_id" {
  description = "Compartment OCID"
}

variable "vcn_cidrs" {
  type        = list(string)
  description = "CIDR Subnet to use for the VPC"
}

variable "vcn_name" {
  type        = string
  description = "VCN Name"
}

variable "tags" {
  description = "Contains default tags for this project"
  type        = map(string)
  default     = {}
}