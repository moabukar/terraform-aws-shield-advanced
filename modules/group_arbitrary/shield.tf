resource "aws_shield_protection_group" "arbitrary" {
  depends_on          = [aws_shield_protection.shield]

  protection_group_id = var.name
  aggregation         = var.aggregation
  pattern             = "ARBITRARY"
  members             = var.members

  tags = var.tags
}

