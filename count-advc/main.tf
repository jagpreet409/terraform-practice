provider "aws" {
    region = "ap-southeast-2"
}

module "db" {
    source = "./db"
    server_names = ["mariadb","mysql","mssql"]  //3 instanes we are creating
}

output "private_ips" {
    value = module.db.PrivateIP
}