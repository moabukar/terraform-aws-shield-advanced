### Shield Advanced protection for a Cloudfront distribution

module "shield_advanced" {
  source = "github.com/moabukar/terraform-aws-shield-advanced"

  name = "shield-advanced-cloudfront"

  name_resource_arn_map = {
    "cloudfront" = "arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5"
  }
}
