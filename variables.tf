variable "name_resource_arn_map" {
  type        = map(string)
  description = "A map of names and ARNs of resources to be protected. The name will be used as the name of the resource in the AWS console."
  default     = {}
}

variable "name" {
  description = "The name for Shield Protection"
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "cloudfront_distribution_ids" {
  description = "list of CloudFront Distribution IDs which will be protected with AWS Shield Advanced"
  type        = list(string)
  default     = []
}
