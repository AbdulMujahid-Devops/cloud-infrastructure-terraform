data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  name       = var.project_name
  cidr_block = var.vpc_cidr
  azs        = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "storage" {
  source = "./modules/storage"
  name   = var.project_name
}
