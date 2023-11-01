provider "aws" {
  region = "us-east-1"
}

module "shield_all" {
  source = "../../modules/group_all"
  # version = "0.0.1"

  tags = {
    example = "true"
  }
}

output "shield_all" {
  value = module.shield_all
}
