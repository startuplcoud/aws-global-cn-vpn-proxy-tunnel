output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_ids[0]
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_ids[0]
}