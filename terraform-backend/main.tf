terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "archive_file" "zip_the_python_code" {
  type = "zip"
  source_dir = "${path.module}/python/"
  output_path = "${path.module}/python/lambda_function.zip"
}
