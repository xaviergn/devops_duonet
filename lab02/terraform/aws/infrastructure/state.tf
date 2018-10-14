data "terraform_remote_state" "vpc" {
    backend = "s3"
    config {
        bucket = "${var.aws_environment}-terraform-state-moratilla"
        key = "${var.aws_key_name}-terraform-vpc.tfstate"
        region = "eu-west-1"
    }
}
