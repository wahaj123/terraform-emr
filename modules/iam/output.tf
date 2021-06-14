output iam_emr_service_role {
  value       = aws_iam_role.iam_emr_service_role
  description = "description"
}
output aws_iam_instance_profile {
  value       = aws_iam_instance_profile.emr_profile
  description = "description"
}
