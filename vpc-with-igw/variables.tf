## Expected values from the caller
variable "vpc_region" {
  description = "AWS region"
}

# VPC Config
variable "vpc_name" {
  description = "VPC name"
}

variable "vpc_cidr_block" {
  description = "IP addressing for VPC Network"
}

# Tags
variable "squad" {
  description = "Squad tag"
}

variable "tribe" {
  description = "Tribe Tag"
}

variable "env" {
  description = "Environment Tag"
}

variable "repo" {
  description = "Repo Tag"
}

variable "ssh_allowed_subnets" {
  default = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
    "187.72.188.226/32",
  ]
}
