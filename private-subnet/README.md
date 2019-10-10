# Private Subnet

Private subnet module with nat gateway associate.

## Usage

```
module "private_subnet" {
  source = "git@github.com:quintoandar/infrastructure.git//terraform/modules/network/private-subnet"

  vpc_id      = "${var.vpc_id}"
  vpc_region  = "${var.vpc_region}"
  
  subnet_name = "${var.private_subnet_name}"
  subnet_cidr = "${var.private_subnet_cidr}"
  subnet_az   = "${var.private_subnet_az}"
    
  aws_nat_gateway_id  = "${var.aws_nat_gateway_id}"

  env   = "${terraform.workspace}"
  tribe = "${var.tribe}"
  squad = "${var.squad}"
  repo  = "${var.repo}"
}
```

# Dependencies

* VPC
* Nat Gateway