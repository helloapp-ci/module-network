# VPC

VPC module with internet gateway.

## Usage

```
module "vpc_with_igw" {
    source = "git@github.com:quintoandar/infrastructure.git//terraform/modules/network/vpc-with-igw"
    
    vpc_name = "${var.vpc_name}"
    vpc_cidr_block = "${var.vpc_cidr_block}"
    
    vpc_region = "${var.vpc_region}"
    
    env = "${terraform.workspace}"
    tribe = "${var.tribe}"
    squad = "${var.squad}"
    repo  = "${var.repo}"
}
```