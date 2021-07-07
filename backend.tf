terraform {
  backend "s3" {
    bucket  = "okeer-devops"
    profile = "sorlov"
    key     = "terraform.tfstate"
    region  = "us-east-1"
  }
}
