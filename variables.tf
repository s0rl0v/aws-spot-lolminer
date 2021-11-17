# General

variable "region" {
  type        = string
  description = "Default AWS region"
  default     = "us-east-1"
}

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base CIDR"
}

# Miner configuration

variable "wallet" {
  type        = string
  description = "ETH wallet to mine"
}

variable "app_version" {
  type        = string
  description = "Lolminer version"
  default     = "1.36a"
}

# GPU instance configuration

variable "spot_instance_type" {
  type        = string
  description = "Spot instance type"
  default     = "g5.xlarge"
}

variable "spot_capacity" {
  type        = number
  description = "Number of spot instances to maintain"
  default     = 16
}

variable "max_price" {
  type        = string
  description = "Maximum price per hour (USD) to pay for instance"
  default     = "0.36"
}
