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
  #source  = "moabukar/shield-advanced/aws"
  source  = "../../"
  version = "0.0.1"
  name    = "shield-advanced-cloudfront"

  name_resource_arn_map = {
    "cloudfront" = "arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5"
  }
  tags = {
    environment = "staging"
  }
}

output "shield" {
  value = module.shield
}
