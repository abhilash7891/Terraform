resource "aws_vpc" "main"
{
    cidr_block="${var.vpc_cidr_Block}"
}

resource "aws_subnet" "subnet1"
{
    vpc="${aws_vpc.main.id}"
    cidr_block="${var.subnet_cidr_Block[0]}"
}

resource "aws_subnet" "subnet2"
{
    vpc="${aws_vpc.main.id}"
    cidr_block="${var.subnet_cidr_Block[1]}"
}

resource "aws_subnet" "subnet3"
{
    vpc="${aws_vpc.main.id}"
    cidr_block="${var.subnet_cidr_Block[2]}"
}