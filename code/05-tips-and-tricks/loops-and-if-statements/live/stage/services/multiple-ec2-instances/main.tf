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

resource "aws_instance" "example_1" {
  count         = 3
  ami           = "ami-0bf69afb300c322eb"
  instance_type = "t3.micro"
}

resource "aws_instance" "example_2" {
  count             = length(data.aws_availability_zones.all.names)
  availability_zone = data.aws_availability_zones.all.names[count.index]
  ami               = "ami-0bf69afb300c322eb"
  instance_type     = "t3.micro"
}

data "aws_availability_zones" "all" {}

