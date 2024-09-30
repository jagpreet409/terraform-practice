provider "aws" {
  region = "ap-southeast-2"
} //which plugin to use 


resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}
