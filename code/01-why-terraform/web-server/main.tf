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

resource "aws_instance" "app" {
  instance_type     = "t3.micro"
  availability_zone = "me-south-1a"
  ami               = "ami-0bf69afb300c322eb"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}

