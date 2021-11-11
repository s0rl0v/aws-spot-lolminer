data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Deep Learning AMI (Amazon Linux 2) Version 52.0"]
  }
}
