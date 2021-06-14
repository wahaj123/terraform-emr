variable "configuration" {
  type = object({
    profile = string
    region  = string
  })
}
variable "vpc" {
  type = object({
    private_subnet = list(string)
    public_subnet  = list(string)
    cidr           = string
  })
}
variable "iam" {
  description = "configuration for Iam role"

}

variable "emr" {
  description = "configuration for emr cluster"
}
