variable "vpc_cidr_block" { }
variable "ENV" { }

variable "project-name" { }

variable "created-by" {
    default = "Terraform"
}
variable "private_subnet_cidr_block" {
    type="list"
}
variable "public_subnet_cidr_block"  {
    type="list"
}

