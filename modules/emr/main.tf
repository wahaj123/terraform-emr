resource "aws_emr_cluster" "cluster" {
  name          = var.name
  release_label = var.release_label
  applications  = var.applications

  ec2_attributes {
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = var.master_security_group
    emr_managed_slave_security_group  = var.slave_security_group
    instance_profile                  = var.instance_profile
    key_name                          = var.key_name
  }

  master_instance_group {
    instance_type = var.master_instance_group.instance_type
  }

  core_instance_group {
    instance_count = var.core_instance_group.instance_count
    instance_type  = var.core_instance_group.instance_type
  }

  tags = {
    role     = var.tags.role
    dns_zone = var.tags.dns_zone
    env      = var.tags.env
    name     = var.tags.name
  }

  bootstrap_action {
    path = var.bootstrap_action.path
    name = var.bootstrap_action.name
    args = var.bootstrap_action.args
  }

  configurations_json = <<EOF
  [
    {
      "Classification": "hadoop-env",
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
          }
        }
      ],
      "Properties": {}
    },
    {
      "Classification": "spark-env",
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
          }
        }
      ],
      "Properties": {}
    }
  ]
EOF

  service_role = var.service_role
}
