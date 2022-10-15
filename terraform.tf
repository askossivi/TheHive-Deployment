# Terraform Block
terraform {
  required_version = "> 0.14.6" # which means >= 0.14.6 and < 0.15
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3.0"
    }
  }


# Adding Backend as s3 for remote state storage
  backend "s3" {
    bucket = "back-end-dev-bucket"
    key = "dev-folder/terraform.tfstate"
    region = "us-east-2"

    # For State Locking
    dynamodb_table = "tf-table"
  }

}

