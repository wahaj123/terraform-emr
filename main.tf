data "aws_availability_zones" "azs" {}


module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr          = var.vpc.cidr
  public_subnet     = var.vpc.public_subnet
  private_subnet    = var.vpc.private_subnet
  availability_zone = data.aws_availability_zones.azs.names
}

module "iam" {
  source                = "./modules/iam"
  service_role_name     = var.iam.iam_emr_service_role_name
  service_policy_name   = var.iam.iam_emr_service_policy_name
  profile_role_name     = var.iam.iam_emr_profile_role_name
  instance_profile_name = var.iam.aws_iam_instance_profile_name
  profile_policy_name   = var.iam.iam_emr_profile_policy_name
}

module "security_group" {
  source = "./modules/securitygroups"
  vpc    = module.vpc.output
  tag    = "emr-sg"
  ingress_rule_list = [
    {
      source_security_group_id = null
      cidr_blocks              = [module.vpc.output.cidr_block]
      description              = "All Web Traffic (22)"
      from_port                = 22
      protocol                 = "tcp"
      to_port                  = 22
    },
    {
      source_security_group_id = null
      cidr_blocks              = [module.vpc.output.cidr_block]
      description              = "All Web Traffic ()"
      from_port                = 0
      protocol                 = "-1"
      to_port                  = 0
    },
  ]
}
module "emr" {
  source                = "./modules/emr"
  name                  = var.emr.name
  release_label         = var.emr.release_label
  applications          = var.emr.applications
  master_instance_group = var.emr.master_instance_group
  core_instance_group   = var.emr.core_instance_group
  tags                  = var.emr.tags
  bootstrap_action      = var.emr.bootstrap_action
  instance_profile      = module.iam.aws_iam_instance_profile.arn
  service_role          = module.iam.iam_emr_service_role.arn
  slave_security_group  = module.security_group.output.sg.id
  master_security_group = module.security_group.output.sg.id
  subnet_id             = module.vpc.output.public_subnet[0]
  key_name              = var.emr.key_name
}
