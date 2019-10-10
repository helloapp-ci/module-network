resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh_allowed_subnets}"]
    description = "Open ssh from office"
  }

  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags {
    Name        = "${var.vpc_name}-default"
    Env         = "${var.env}"
    Squad       = "${var.squad}"
    Tribe       = "${var.tribe}"
    Repo        = "${var.repo}"
    Provisioner = "Terraform"
  }
}
