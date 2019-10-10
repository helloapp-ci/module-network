# Define a vpc
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = "true"

  tags {
    Name        = "${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Provisioner = "Terraform"
  }
}

# Internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Provisioner = "Terraform"
  }
}
