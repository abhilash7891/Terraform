resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

 }


resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "public-rt-assoc" {
    count           = "${length(var.public_subnet_cidr_block)}"
    subnet_id       = "${element(aws_subnet.public_subnet.*.id, count.index)}"
    route_table_id  = "${aws_route_table.Public_route_table.id}"
}

resource "aws_route_table_association" "private-rt-assoc" {
    count           = "${length(var.private_subnet_cidr_block)}"
    subnet_id       = "${element(aws_subnet.private-subnet.*.id, count.index)}"
    route_table_id  = "${aws_route_table.Private_route_table.id}"
}
