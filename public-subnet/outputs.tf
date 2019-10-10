output "subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "subnet_name" {
  value = "${aws_subnet.public.tags.Name}"
}

output "subnet_az" {
  value = "${var.subnet_az}"
}

output "aws_nat_gateway_id" {
  value = "${aws_nat_gateway.nat.id}"
}
