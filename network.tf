data "aws_availability_zones" "available" {
  state = "available"
}

module "cidrs" {
  source  = "hashicorp/subnets/cidr"
  version = "1.0.0"

  base_cidr_block = var.cidr
  networks = [
    for az in data.aws_availability_zones.available.names : {
      name     = az,
      new_bits = 8
    }
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name = "lol-test"
  cidr = var.cidr

  azs            = keys(module.cidrs.network_cidr_blocks)
  public_subnets = values(module.cidrs.network_cidr_blocks)

  enable_nat_gateway = false

  tags = {
    Terraform = "true"
  }
}