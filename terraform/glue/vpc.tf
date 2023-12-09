# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.250.0.0/16"

  tags = local.common_tags
}

# Subnets
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.250.0.0/24"

  tags = local.common_tags
}

# Security Group
# ...