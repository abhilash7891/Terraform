variable "ENV" {}
variable "project-name" {}
variable "created-by" {}
variable "private_subnet_cidr_block" {
    type="list"
}
variable "public_subnet_cidr_block" {
    type="list"
}

variable "vpc_cidr_block" { }

data "aws_availability_zones" "azs" {}
