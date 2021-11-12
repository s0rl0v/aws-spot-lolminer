resource "aws_launch_template" "this" {
  name          = "mining-template"
  image_id      = data.aws_ami.this.id
  user_data     = base64encode(templatefile("${path.module}/templates/bootstrap.sh.tpl", { wallet = var.wallet, version = var.app_version }))

  network_interfaces {
    associate_public_ip_address = true
  }
}

resource "aws_spot_fleet_request" "this" {
  iam_fleet_role                      = data.aws_iam_role.this.arn
  terminate_instances_with_expiration = true
  valid_until                         = "2032-11-04T20:44:20Z"

  allocation_strategy = "capacityOptimized"
  target_capacity     = var.spot_capacity

  spot_price = var.max_price

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
