data "terraform_remote_state" "foo" {
    backend = "s3"
    config {
        bucket = "${var.aws_environment}-terraform-state-devopsworkshop"
        key = "${var.aws_key_name}-terraform.tfstate"
        region = "eu-west-1"
    }
}
