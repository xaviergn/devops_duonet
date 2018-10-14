variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "aws_environment" {}

variable "repo_site" {
    default = "http://localhost:8081/nexus"
}

variable "repo_user" {}

variable "repo_password" {}

variable "app_group_id" {
    default = "es.examplecorp"
}

variable "app_artifact_id" {
    default = "MyApp"
}

variable "app_version" {
    default = "1.0-SNAPSHOT"
}

variable "app_repository" {
    default = "snapshots"
}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-west-1"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        eu-west-1 = "ami-0d77397e" # ubuntu 16.04 LTS
    }
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

variable "vpc_id" {}
variable "public_subnet_id" {}

output "web_ip" {
    value = "${aws_eip.web.public_ip}"
}

