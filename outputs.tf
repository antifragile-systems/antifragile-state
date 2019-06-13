output "aws_s3_bucket" {
  value = aws_s3_bucket.antifragile-infrastructure.bucket
}

output "aws_dynamodb_table_name" {
  value = aws_dynamodb_table.antifragile-infrastructure.name
}

