module "Network" {
    source="./Modules/Network"
    ENV="${var.ENV}"
    project-name="${var.project-name}"
    created-by="${var.created-by}"
    vpc_cidr_block="${var.vpc_cidr_block}"
    private_subnet_cidr_block ="${var.private_subnet_cidr_block}"
    public_subnet_cidr_block ="${var.public_subnet_cidr_block}"
}


module "Database" {
  source                = "./Modules/Database"
  ENV                   = "${var.ENV}"
  VPC_ID                = "${module.Network.vpc_id}"
  PUBLIC_SUBNETS        = "${module.Network.public_subnets}"
  PRIVATE_SUBNETS       = "${module.Network.private_subnets}"
  DB_INSTANCE_TYPE      = "${var.DB_INSTANCE_TYPE}"
  DBUSER                = "${var.DBUSER}"
  DBPASS                = "${var.DBPASS}"
  VPC_CIDR              = "${var.VPC_CIDR}"
}