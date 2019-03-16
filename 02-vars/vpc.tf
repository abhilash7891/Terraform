resource "aws_vpc" "main"
{
    cidr_block="${var.vpc_cidr_Block}"
}

resource "aws_subnet" "subnet-[count.index]"
{
 count=3
    vpc_id="${aws_vpc.main.id}"
    cidr_block="${var.subnet_cidr_Block[count.index]}"
}
