provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-0e8fd5cc56e4d158c"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id

}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}