provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

variable "test" {
  default = "not change"
}

output "test" {
  value = var.test
}
