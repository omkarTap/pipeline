provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-jenkins-bucket"
  acl    = "private"
}

terraform {
  backend "s3" {
    bucket = "my-tf-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
