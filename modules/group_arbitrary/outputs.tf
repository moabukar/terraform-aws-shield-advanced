output "created_protection_group" {
  value = aws_shield_protection_group.arbitrary
}

output "created_protections" {
  value = aws_shield_protection.shield
}
