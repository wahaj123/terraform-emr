configuration = {
    region = "us-east-2"
    profile = "wahaj"
}

#vpc
vpc = {
    cidr            =   "13.0.0.0/16"
    public_subnet   =   ["13.0.1.0/24", "13.0.2.0/24","13.0.3.0/24"]
    private_subnet  =   ["13.0.4.0/24", "13.0.5.0/24","13.0.6.0/24"]
}

iam = {
    iam_emr_service_role_name= "iam_emr_service_role"
    iam_emr_service_policy_name="iam_emr_service_policy"
    iam_emr_profile_role_name="iam_emr_profile_role"
    aws_iam_instance_profile_name="emr_profile"
    iam_emr_profile_policy_name="iam_emr_profile_policy"

}

emr = {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Hadoop"]
  key_name      = "emr-keypair"
  master_instance_group = {
    instance_type = "m4.large"
  }

  core_instance_group = {
    instance_count = 1
    instance_type  = "m4.xlarge"
  }

  tags = {
    role     = "rolename"
    dns_zone = "env"
    env      = "env"
    name     = "name-env"
  }

  bootstrap_action = [
    {
      path = "s3://emr-testing-123/script.sh"
      name = "runif"
      args = ["instance.isMaster=true", "echo running on master node"]
    },
    {
      path = "s3://emr-testing-1234/script2.sh"
      name = "runif"
      args = ["instance.isMaster=true", "echo running on master node"]
    },
  ]
}