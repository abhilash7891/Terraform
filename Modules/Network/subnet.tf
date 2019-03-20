resource "aws_subnet" "subnet"
{
 count=3
    vpc_id="${aws_vpc.main.id}"
    cidr_block="${var.subnet_cidr_Block[count.index]}"
    availability_zone="${data.aws_availability_zones.main.names[count.index]}"
tags={
    name="${var.tags["name"]}"
    Project-name="${var.tags["project"]}"
    project-ENV="${ENV}"
}
}
