variable "compartment_id" {
  description = "Compartment OCID"
}

variable "vcn_cidrs" {
  type        = list(string)
  description = "CIDR Subnet to use for the VPC"
}

variable "label_prefix" {
  type        = string
  description = "A string that will be prepended to all VCN resources"
}

variable "tags" {
  description = "Contains default tags for this project"
  type        = map(string)
  default     = {}
}