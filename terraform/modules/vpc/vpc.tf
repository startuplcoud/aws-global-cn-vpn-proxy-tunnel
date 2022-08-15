module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  name    = var.vpc_name

  cidr = var.vpc_cidr_block
  azs  = data.aws_availability_zones.available.names

  private_subnets = [
    for num in range(length(data.aws_availability_zones.available.names)) :
    cidrsubnet(var.vpc_cidr_block, 8, num)
    // 10.0.0.0/24, 10.0.1.0/24,10.0.2.0/24
  ]

  public_subnets = [
    for num in range(length(data.aws_availability_zones.available.names)) :
    cidrsubnet(var.vpc_cidr_block, 8, num + length(data.aws_availability_zones.available.names) + 1)
    //10.0.3.0/24,10.0.4.0/24,10.0.5.0/24
  ]

  private_subnet_tags = {
    Tier = "private"
  }

  public_subnet_tags = {
    Tier = "public"
  }

  enable_nat_gateway = false
  single_nat_gateway = true
  # enable signal NAT Gateway to save the budget
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true
  enable_dns_support     = true
  reuse_nat_ips          = true

}