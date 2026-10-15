provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Serverless-Event-Driven"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

# DynamoDB NoSQL Database Module
module "dynamodb" {
  source      = "./modules/dynamodb"
  environment = var.environment
}

# SQS Message Queue Module
module "sqs" {
  source      = "./modules/sqs"
  environment = var.environment
}

# Lambda Compute Module (Shares ARNs with DynamoDB and SQS for IAM permissions)
module "lambda" {
  source             = "./modules/lambda"
  environment        = var.environment
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
  sqs_queue_arn      = module.sqs.sqs_queue_arn
  sqs_queue_url      = module.sqs.sqs_queue_url
}

# API Gateway HTTP API Module (Public entry point linked to Lambda)
module "api_gateway" {
  source               = "./modules/api_gateway"
  environment          = var.environment
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  lambda_function_name = module.lambda.lambda_function_name
}