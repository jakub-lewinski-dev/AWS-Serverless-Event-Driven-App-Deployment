variable "aws_region" {
    type = string
    default = "eu-central-1"
    descrption = "Target AWS Region (Frankfurt)"
}

variable "enviroment" {
    type = string
    default = "dev"
    description = "Deployment environment (e.g., dev, staging, prod)"
}
