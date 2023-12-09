variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Aws Bucket Region for Delta Tables"
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Aws Bucket Env Prefix"
}

variable "bucket_names" {
  type        = list(string)
  description = "Aws default buckets"
  default = [
    "landing",
    "bronze",
    "silver",
    "gold"
  ]
}

variable "gold_bucket_name" {
  type        = string
  description = "Aws Gold Bucket name for fast recovery in tf"
  default     = "${var.prefix}-${var.environment}-gold"
}

variable "prefix" {
  type        = string
  default     = "grc"
  description = "Aws default prefix"
}

locals {
  prefix = var.prefix
  common_tags = {
    Project     = "grc-gas-price-forecast"
    Terraform   = true
    Environment = "dev"
  }
}