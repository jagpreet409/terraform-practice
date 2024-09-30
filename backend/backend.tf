terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate" //folder path where you want to store
    bucket = "jp-remote-backend"
    region = "ap-southeast-2"
    access_key = ""
    secret_key = ""
  }
}