provider "aws" {
  region = us-east-1
}

# Only protecting CloudFront Distributions

module "shield_resource_type" {
  source  = "../modules/group_resource_type"
  version = "0.0.1"

  tags = {
    environment = "staging"
  }
  application_load_balancers = false
  route53_hosted_zones     = false
  global_accelerators      = false
  classic_load_balancers   = false
  elastic_ip_addresses     = false
}

output "shield_resource_type" {
  value = module.shield_resource_type
}
