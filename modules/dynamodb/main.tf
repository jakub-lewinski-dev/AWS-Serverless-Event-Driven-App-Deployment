resource "aws_dynamodb_table" "main" {
  name         = "serverless-app-data-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name = "serverless-app-table"
  }
}