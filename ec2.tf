data "aws_ami" "this" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Deep Learning AMI (Amazon Linux 2) Version 44.0"]
  }
}

resource "aws_launch_template" "this" {
  name      = "${terraform.workspace}-mining-template"
  image_id  = data.aws_ami.this.id
  user_data = base64encode(templatefile("${path.module}/templates/bootstrap.sh.tpl", { wallet = var.wallet, version = var.app_version }))

  network_interfaces {
    associate_public_ip_address = true
  }
}

resource "aws_spot_fleet_request" "this" {
  iam_fleet_role                      = "arn:aws:iam::828162785311:role/aws-service-role/spotfleet.amazonaws.com/AWSServiceRoleForEC2SpotFleet"
  terminate_instances_with_expiration = true
  valid_until                         = "2032-11-04T20:44:20Z"

  allocation_strategy = "lowestPrice"
  target_capacity     = var.spot_capacity

  dynamic "launch_template_config" {
    for_each = module.vpc.public_subnets
    content {
      launch_template_specification {
        id      = aws_launch_template.this.id
        version = aws_launch_template.this.latest_version
      }

      overrides {
        instance_type     = var.spot_instance_type
        subnet_id         = launch_template_config.value
        weighted_capacity = 1
      }
    }
  }
}
