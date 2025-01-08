terraform {
  backend "s3" {
    bucket  = "project10-shs-s3-backend"
    key     = "terraform/shs/jenkins/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "project10-shs-dynamodb-lock"
  }
}