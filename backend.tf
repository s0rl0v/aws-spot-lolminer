terraform {
  backend "s3" {
    bucket = "okeer-devops"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 0.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
