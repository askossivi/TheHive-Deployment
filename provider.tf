# Provider Block
provider "aws" {
  region  = var.aws_region
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on my local desktop terminal  
$HOME/.aws/credentials
*/
