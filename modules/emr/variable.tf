variable name {
  type        = string
  default     = ""
  description = "Name of the emr cluster"
}
variable release_label {
  default     = ""
  description = "release label of emr cluster"
}
variable applications {
  default     = ""
  description = "Application to deploy on emr cluster"
}
variable master_instance_group {
  default     = ""
  description = "Setting of master_instance group"
}
variable core_instance_group {
  default     = ""
  description = "Setting of core_instance group"
}
variable tags {
  default     = ""
  description = "tags for emr cluster"
}
variable bootstrap_action {
  default     = ""
  description = "setting for script to run"
}
variable subnet_id {
  default     = ""
  description = "subnet id for emr cluster"
}
variable master_security_group {
  default     = ""
  description = "security group of master"
}
variable slave_security_group {
  default     = ""
  description = "security group of slave"
}
variable instance_profile {
  default     = ""
  description = "instance profile for emr cluster"
}
variable service_role {
  default     = ""
  description = "service role for emr cluster"
}
variable key_name {
  default     = ""
  description = "key pair for emr master node"
}
variable service_access_sg {
  default     = ""
  description = "security group needed for private subnet"
}
