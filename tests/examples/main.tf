provider "aws" {
  region = "us-east-1"
}


data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# Create an Elastic IP to be protected
resource "aws_eip" "example" {
  vpc = true
}

# Protect the EIP
module "shield" {
  # Once published
  # source  = "moabukar/shield-advanced/aws"
  # version = "0.0.1"

  # For local testing
  source = "../../"

  name = "example_shield"

  name_resource_arn_map = {
    "example_resource" = "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.example.id}"
  }
  tags = {
    environment = "staging"
  }
}

output "shield" {
  value = module.shield
}
