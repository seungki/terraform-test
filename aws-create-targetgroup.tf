terraform {

  cloud {
    organization = "sk-aws-private"

    workspaces {
      name = "terraform-test"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }

  required_version = ">= 1.1.0"
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

# Create target group
resource "aws_lb_target_group" "test" {
  name     = "TG-TEST"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    SYSTEM = "TEST"
  }
}
