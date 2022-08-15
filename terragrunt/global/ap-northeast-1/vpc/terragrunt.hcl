include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../..//terraform/modules/vpc"
}

locals {
  vpc_cidr_block = "172.31.0.0/16"
}

inputs = {
  vpc_name       = "global-vpc"
  vpc_cidr_block = local.vpc_cidr_block
}
