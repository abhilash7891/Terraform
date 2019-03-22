resource "aws_security_group" "rds" {
  name        = "Allow VPC - RDS Connections"
  description = "Allow VPC - RDS Connections"
  vpc_id      = "${var.VPC_ID}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.VPC_CIDR}"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  }