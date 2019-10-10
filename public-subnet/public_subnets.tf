# Define a public subnet
resource "aws_subnet" "public" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.vpc_region}${var.subnet_az}"

  tags {
    Name        = "public-${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Tier        = "public"
    Provisioner = "Terraform"
  }

  lifecycle {
    ignore_changes = "tags"
  }
}

# Routing table
resource "aws_route_table" "public_route_table" {
  vpc_id = "${var.vpc_id}"

  propagating_vgws = [
    "${var.route_table_propagating_vgws}",
  ]

  tags {
    Name        = "public-${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Tier        = "public"
    Provisioner = "Terraform"
  }
}

# Route the internet bound traffic via Internet Gateway
resource "aws_route" "gateway_route" {
  route_table_id         = "${aws_route_table.public_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.aws_internet_gateway_id}"
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

# NAT Gateway.
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public.id}"

  tags {
    Name        = "${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Provisioner = "Terraform"
  }
}

# Elastic IP
resource "aws_eip" "eip" {
  vpc = true

  tags {
    Name        = "${var.subnet_name}-${var.subnet_az}-${var.vpc_name}"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Provisioner = "Terraform"
  }
}
