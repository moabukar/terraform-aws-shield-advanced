provider "aws" {
  region = us-east-1
}

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# Create an Elastic IP address to be protected.
resource "aws_eip" "example" {
  vpc = true
}

# Protect the Elastic IP address.
module "shield" {
  source  = "../modules/group_resource_type"
  version = "0.0.1"

  # Pass in the name you wish to use for the resource, and the ARN of the resource to be protected.
  name_resource_arn_map = {
    "example_resource_for_group" = "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.example.id}"
  }
  tags = {
    environment = "staging"
  }
}

output "shield" {
  value = module.shield
}

# Add previously protected resources into group.
module "shield_arbitrary" {
  source  = "../modules/group_resource_type"
  version = "0.0.1"

  name    = "shield_group"
  members = ["arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.example.id}"]

  tags = {
    environment = "dev"
  }
}

output "shield-arbitrary" {
  value = module.shield-arbitrary
}
