# AWS Shield Advanced Terraform module


Creates AWS Shield Advanced protection for a single resource.

These resources can include:

- Cloudfront distribution

- Route 53 Hosted Zone

- Global Accelerator

- Application load balancer

- Classic load balancer

- Elastic IP address

## Examples

### Shield Advanced protection for a Cloudfront distribution

```hcl
### Shield Advanced protection for a Cloudfront distribution

module "shield_advanced" {
  source = "github.com/moabukar/terraform-aws-shield-advanced"

  name = "shield-advanced-cloudfront"

  name_resource_arn_map = {
    "cloudfront" = "arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.74, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_shield_advanced"></a> [shield\_advanced](#module\_shield\_advanced) | github.com/moabukar/terraform-aws-shield-advanced | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_shield_protection.shield](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/shield_protection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_distribution_ids"></a> [cloudfront\_distribution\_ids](#input\_cloudfront\_distribution\_ids) | list of CloudFront Distribution IDs which will be protected with AWS Shield Advanced | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for Shield Protection | `any` | n/a | yes |
| <a name="input_name_resource_arn_map"></a> [name\_resource\_arn\_map](#input\_name\_resource\_arn\_map) | A map of names and ARNs of resources to be protected. The name will be used as the name of the resource in the AWS console. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_shield"></a> [shield](#output\_shield) | A map of properties for the created AWS Shield protection. |

## Local testing

```bash

export AWS_ACCESS_KEY_ID=<>
export AWS_SECRET_ACCESS_KEY=<>
export AWS_DEFAULT_REGION=<>

terraform init
terraform plan
terraform apply

```
