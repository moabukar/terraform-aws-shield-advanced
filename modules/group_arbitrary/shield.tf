resource "aws_shield_protection_group" "arbitrary" {
  # depends_on          = [aws_shield_protection.shield]

  protection_group_id = var.name
  aggregation         = var.aggregation
  pattern             = "ARBITRARY"
  members             = var.members
  # members = concat(var.members, var.cloudfront_arns)

  tags = var.tags
}

