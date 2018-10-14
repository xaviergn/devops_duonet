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

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "WebServerSG"
    }
}

resource "aws_instance" "web" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "eu-west-1a"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.eu-west-1a-public.id}"
    associate_public_ip_address = true
    source_dest_check = false

    #provisioner "file" {
        #connection {
          #user = "ubuntu"
          #host = "${aws_instance.web.public_ip}"
          #timeout = "1m"
          #key_file = "${var.aws_key_path}"
        #}
        #source = "go.sh"
        #destination = "/home/ubuntu/go.sh"
    #}
#
    #provisioner "remote-exec" {
        #connection {
          #user = "ubuntu"
          #host = "${aws_instance.web.public_ip}"
          #timeout = "1m"
          #key_file = "${var.aws_key_path}"
        #}
        #script = "go.sh"
    #}


    tags {
        Name = "web-${count.index + 1}-${var.aws_environment}"
        Env  = "${var.aws_environment}"
        test = "true"
    }
    count = 1
}

resource "aws_eip" "web" {
    instance = "${aws_instance.web.id}"
    vpc = true
}
