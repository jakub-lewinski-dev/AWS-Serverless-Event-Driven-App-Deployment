output "api_endpoint" {
  value       = module.api_gateway.api_endpoint
  description = "Public HTTP endpoint URL for API Gateway"
}

output "dynamodb_table_name" {
  value       = module.dynamodb.dynamodb_table_name
  description = "Name of the DynamoDB table"
}

output "sqs_queue_url" {
  value       = module.sqs.sqs_queue_url
  description = "URL of the main SQS queue"
}