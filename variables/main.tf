provider "aws" {
  region = "ap-southeast-2"
}

variable "vpcname" {
     type = string
     default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {  //boolean values
  default = true
}

variable "mylist" {
  type = list(string) //can only be one type we can store
  default = [ "Value1","Value2" ]
}

variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags ={
       // Name = var.vpcname
        Name = var.inputname
    }
}

output "vpcid" {
   value = aws_vpc.myvpc.id
}

//tuples

variable "mytuple" {
  type = tuple([string,number,string  ])   //we can specify the data type inside the list multiple
  default = [ "cat", 0, "dog" ]
}

//objects

variable "myobjects" {
  type = object({
    name = string,
    port = list(number)
  })
  default = {
    name = "JP"
    port = [ 22,25,80 ]
  }
}