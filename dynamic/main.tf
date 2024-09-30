provider "aws" {
  region = "ap-southeast-2"
}

variable "ingressrules" {
  type = list(number)
  default = [ 80,443 ]
}

variable "iegressrules" {
  type = list(number)
  default = [ 80,443,25,3306,53,8080 ]
}

resource "aws_instance" "ec2" {
  ami = "ami-0e8fd5cc56e4d158c"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
         iterator = port
         for_each = var.iegressrules

        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

}