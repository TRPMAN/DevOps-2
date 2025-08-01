# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# ENV Var
variable "environment" {
  description = "Environment Variable"
  type = string
  default = "devops"
}

# Business Division
variable "business_division" {
  description = "Business Division this infrastructure belongs to"
  type        = string
  default     = "trpman1"
}