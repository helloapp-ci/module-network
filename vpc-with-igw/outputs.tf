## Variables being exported for downstream consumption
output "name" {
  value = "${var.vpc_name}"
}

output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "aws_internet_gateway_id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}
