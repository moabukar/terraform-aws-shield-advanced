provider "aws" {
}

module "shield-all" {
  source  = "../../modules/group_all"
  version = "0.0.1" 

  tags = {
    example = "true"
  }
}

output "shield-all" {
  value = module.shield-all
}
