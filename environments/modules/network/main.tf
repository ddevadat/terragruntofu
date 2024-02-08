module "vcn" {
  source                  = "oracle-terraform-modules/vcn/oci"
  version                 = "3.6.0"
  compartment_id          = var.compartment_id
  label_prefix            = var.label_prefix
  vcn_cidrs               = var.vcn_cidrs
  create_internet_gateway = false
  freeform_tags           = var.tags

}