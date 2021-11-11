terraform {
  backend "s3" {
    bucket               = "okeer-devops"
    profile              = "sorlov"
    workspace_key_prefix = "terraform"
    key                  = "terraform.tfstate"
    region               = "us-east-1"
  }
}
