# Public Subnet

Public subnet module with internet gateway associate. This module also creates a Nat Gateway.

## Usage

```
module "public_subnet" {
  source = "git@github.com:quintoandar/infrastructure.git//terraform/modules/network/public-subnet"

  vpc_id      = "${var.vpc_id}"
  vpc_region  = "${var.vpc_region}"
  
  subnet_name = "${var.public_subnet_name}"
  subnet_cidr = "${var.public_subnet_cidr}"
  subnet_az   = "${var.public_subnet_az}"
    
  aws_internet_gateway_id  = "${var.internet_gateway_id}"

  env   = "${terraform.workspace}"
  tribe = "${var.tribe}"
  squad = "${var.squad}"
  repo  = "${var.repo}"
}
```

# Dependencies

* VPC
* Internet Gateway