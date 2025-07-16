provider "aws" {
  region = "us-east-1"
  profile = "~/.aws/credentials"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-jenkins-bucket"
}

