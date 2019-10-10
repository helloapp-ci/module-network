## Expected values from the caller

# VPC Config
variable "vpc_id" {
  description = "VPC id"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "vpc_region" {
  description = "AWS region"
}

# Private Subnet Config
variable "subnet_name" {
  description = "Private subnet name"
}

variable "subnet_cidr" {
  description = "IP addressing for private subnet network"
}

variable "subnet_az" {
  description = "Availability Zone for private subnet"
}

# Nat gateway
variable "aws_nat_gateway_id" {
  description = "Internet Gateway id"
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

variable "route_table_propagating_vgws" {
  default = []
}
