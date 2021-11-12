module "cidrs" {
  source  = "hashicorp/subnets/cidr"
  version = "1.0.0"

  base_cidr_block = var.cidr
  networks = [
    for az in data.aws_ec2_instance_type_offerings.this.locations : {
      name     = az,
      new_bits = 8
    }
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0"

  name = "mining"
  cidr = var.cidr

  azs            = toset(keys(module.cidrs.network_cidr_blocks))
  public_subnets = toset(values(module.cidrs.network_cidr_blocks))

  enable_nat_gateway = false
}
