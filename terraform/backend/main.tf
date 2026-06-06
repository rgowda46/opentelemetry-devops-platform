# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "demo-terraform-eks-rohith-state-bucket-46"
  # lifecycle {
  #   prevent_destroy = true  
  # }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "terraform-eks-state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}