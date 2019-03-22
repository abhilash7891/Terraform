resource "aws_subnet" "private_subnet"
{
 count="${length(var.private_subnet_cidr_block)}"
    vpc_id="${aws_vpc.main.id}"
    cidr_block="${element(var.private_subnet_cidr_block.*.id,count.index)}"
    availability_zone="${data.aws_availability_zones.main.names[count.index]}"
tags={
    name="${var.tags["name"]}"
    Project-name="${var.tags["project"]}"
    project-ENV="${ENV}"
}
}

resource "aws_subnet" "public_subnet"
{
 count="${length(var.public_subnet_cidr_block)}"
    vpc_id="${aws_vpc.main.id}"
    cidr_block="${element(var.public_subnet_cidr_block,count.index)}"
    availability_zone="${data.aws_availability_zones.main.names[count.index]}"
tags={
    name="${var.tags["name"]}"
    Project-name="${var.tags["project"]}"
    project-ENV="${ENV}"
}
}
