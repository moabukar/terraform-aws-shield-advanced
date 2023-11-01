provider "aws" {
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

  # Pass in the name you wish to use for the resource, and the ARN of the resource to be protected.
  name_resource_arn_map = {
    "example_resource" = "arn:aws:ec2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.example.id}"
  }
  tags = {
    example = "true"
  }
}

output "shield" {
  value = module.shield
}
