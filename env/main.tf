module "us-east-1-miner" {
  source = "../"
  region = "us-east-1"
  wallet = var.wallet
}

module "us-west-2-miner" {
  source = "../"
  region = "us-west-2"
  wallet = var.wallet
}

module "eu-west-1-miner" {
  source = "../"
  region = "eu-west-1"
  wallet = var.wallet
}
