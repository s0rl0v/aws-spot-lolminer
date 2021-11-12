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

module "eu-central-1-miner" {
  source = "../"
  region = "eu-central-1"
  wallet = var.wallet
}
