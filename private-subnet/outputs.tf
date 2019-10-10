output "subnet_id" {
  value = "${aws_subnet.private.id}"
}

output "subnet_name" {
  value = "${aws_subnet.private.tags.Name}"
}

output "subnet_az" {
  value = "${var.subnet_az}"
}
