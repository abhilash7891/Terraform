variable "vpc_cidr_Block" 
{
    default=["10.0.0.0/24"]
}

variable "subnet_cidr_Block"
{
    type ="List"
    Default="[10.0.0.0/16,10.0.1.0/16,10.0.2.0/16]"
}