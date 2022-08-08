provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      iac-type     = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "AWSDOPC01-tfstates-267919140795-eu-west-1-20220609145527572000000001"
    key            = "AWSDOPC01/scenarios/CodePipeline/Cicd/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "AWSDOPC01_tfstates_lock"
  }

  required_providers {
    aws = {
      version = "~> 3.71.0"
      source  = "hashicorp/aws"
    }
  }
}
