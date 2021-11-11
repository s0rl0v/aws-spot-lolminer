provider "aws" {
  profile = "sorlov"
  region  = var.region

  default_tags {
    tags = {
      Managed = "Terraform"
    }
  }
}
