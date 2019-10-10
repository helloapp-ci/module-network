# Define a private subnet
resource "aws_subnet" "private" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.vpc_region}${var.subnet_az}"

  tags {
    Name        = "private-${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Tier        = "private"
    Provisioner = "Terraform"
  }

  lifecycle {
    ignore_changes = "tags"
  }
}

# Routing table for private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = "${var.vpc_id}"

  propagating_vgws = [
    "${var.route_table_propagating_vgws}",
  ]

  tags {
    Name        = "private-${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Tier        = "private"
    Provisioner = "Terraform"
  }
}

## Route the internet bound traffic via NAT Gateway
resource "aws_route" "subnet_private_route" {
  route_table_id         = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.aws_nat_gateway_id}"
}

# Associate the routing table to private subnet
resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}
