terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = var.aws_region
  version = "2.14"
}

resource "aws_s3_bucket" "antifragile-infrastructure" {
  bucket_prefix = "${var.name}."

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "antifragile-infrastructure" {
  name           = var.name
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

