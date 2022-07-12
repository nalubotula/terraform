terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "me-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0bf69afb300c322eb"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform-example"
  }
}

