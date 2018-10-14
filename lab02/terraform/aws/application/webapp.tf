/*
  Web Servers
*/
resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { # SQL Server
        from_port = 1433
        to_port = 1433
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"]
    }
    egress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"]
    }
    egress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port   = 65535
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port   = 65535
        protocol  = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${var.vpc_id}"

    tags {
        Name = "WebServerSG"
    }
}

resource "aws_instance" "web" {
    connection={
        user = "ubuntu"
        key_file = "${var.aws_key_path}"
        timeout = "1m"
        agent = true
    }
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "eu-west-1a"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${var.public_subnet_id}"
    associate_public_ip_address = true
    source_dest_check = false

    provisioner "file" {
        source = "go.sh"
        destination = "/home/ubuntu/go.sh"
    }

    provisioner "remote-exec" {
        inline = [
          "chmod +x /home/ubuntu/go.sh",
          "/home/ubuntu/go.sh -s ${var.repo_site} -u ${var.repo_user} -p ${var.repo_password} -r ${var.app_repository} -g ${var.app_group_id} -a ${var.app_artifact_id} -v ${var.app_version}"
        ]
    }


    tags {
        Name = "${var.aws_key_name}-web-${count.index + 1}-${var.aws_environment}"
        Env  = "${var.aws_environment}"
        test = "true"
    }
    count = 1
}

resource "aws_eip" "web" {
    instance = "${aws_instance.web.id}"
    vpc = true
}
