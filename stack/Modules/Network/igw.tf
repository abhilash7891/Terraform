resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

 }


resource "aws_route_table" "public_RT" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}
data "aws_route_table" "Private_route_table" {
  subnet_id = "${aws_subnet.private_subnet.*.id}"
}

resource "aws_route_table" "private_RT" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "Public_RT_Associate" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.Public_route_table.id}"
}

resource "aws_route_table_association" "Private_RT_Associate" {
  subnet_id      = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.Private_route_table.id}"
}