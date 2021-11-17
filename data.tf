data "aws_ec2_instance_type_offerings" "this" {
  filter {
    name   = "instance-type"
    values = [var.spot_instance_type]
  }

  location_type = "availability-zone"
}

data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Deep Learning Base AMI (Amazon Linux 2) Version 46.0"]
  }
}

data "aws_iam_role" "this" {
  name = "AWSServiceRoleForEC2SpotFleet"
}
