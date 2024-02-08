include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/ddevadat/terragruntofu.git//environments/modules/network"
}

generate "required_providers_override" {
  path = "required_providers_override.tf"

  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform { 
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "${local.common_vars.oci_provider_version}"
    }
  }
}
provider "oci" {
  region           = "${local.common_vars.region}"
  auth             = "InstancePrincipal"
}
EOF
}

inputs = {
  tags                           = local.tags
  tenancy_id                     = local.common_vars.tenancy_id
  compartment_id                 = local.common_vars.compartment_id
  region                         = local.common_vars.region
  bucket_namespace               = local.common_vars.bucket_namespace
  vcn_name                       = local.env_vars.vcn_name
  vcn_cidrs                      = local.env_vars.vcn_cidrs
  bucketname                     = local.env_vars.bucketname
}

locals {
  common_vars = yamldecode(
    file("${find_in_parent_folders("common-vars.yaml")}")
  )
  env_vars = yamldecode(
    file("${find_in_parent_folders("dev-vars.yaml")}")
  )
  tags = local.common_vars.tags
}
