terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

locals {
  environment_name = "dev"
}

module "web_app" {
  source = "../web-app-module"
  environment_name = local.environment_name
  instance_type    = "t2.medium"
  db_user          = "lenoox"
  db_pass          = var.db_pass
  key_name          = "aws-dev-key"
}
