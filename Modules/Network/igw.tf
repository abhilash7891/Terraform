resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}


data "aws_route_table" "Public_route_table" {
  subnet_id = "${aws_subnet.public_subnet.*.id}"
}

data "aws_route" "route" {
  route_table_id         = "${aws_route_table.Public_route_table.*.id}"
  destination_cidr_block = "10.0.1.0/24"
}


data "aws_route_table" "Private_route_table" {
  subnet_id = "${aws_subnet.private_subnet.*.id}"
}

data "aws_route" "route" {
  route_table_id         = "${aws_route_table.Private_route_table.*.id}"
  destination_cidr_block = "10.0.1.0/24"
}
