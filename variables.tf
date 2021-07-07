variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base CIDR"
}

variable "wallet" {
  type        = string
  description = "ETH wallet to mine"
}

variable "spot_instance_type" {
  type        = string
  description = "Spot instance type"
  default     = "p4d.24xlarge"
}

variable "spot_capacity" {
  type        = number
  description = "Number of spot instances to maintain"
  default     = 1
}
