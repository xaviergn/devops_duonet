variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_name" {}
variable "aws_environment" {}


variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-west-1"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

output "vpc_id" {
    value = "${aws_vpc.default.id}"
}

output "public_subnet_id" {
    value = "${aws_subnet.eu-west-1a-public.id}"
}

output "private_subnet_cidr" {
    value = "${var.private_subnet_cidr}"
}
