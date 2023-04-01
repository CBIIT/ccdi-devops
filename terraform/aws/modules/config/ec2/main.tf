resource "aws_config_config_rule" "ebs_in_backup_plan" {
  name        = "ebs-in-backup-plan"
  description = "Checks whether the Amazon EBS volume is protected by a backup plan."

  source {
    owner             = "AWS"
    source_identifier = "EBS_IN_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "ebs_last_backup_recovery_point_created" {
  name        = "ebs-last-backup-recovery-point-created"
  description = "Checks whether the last backup recovery point was created for the Amazon EBS volume."

  source {
    owner             = "AWS"
    source_identifier = "EBS_LAST_BACKUP_RECOVERY_POINT_CREATED"
  }
}

resource "aws_config_config_rule" "ebs_optimized_instance" {
  name        = "ebs-optimized-instance"
  description = "Checks whether the Amazon EC2 instance is optimized for Amazon EBS I/O."

  source {
    owner             = "AWS"
    source_identifier = "EBS_OPTIMIZED_INSTANCE"
  }
}

resource "aws_config_config_rule" "ebs_resources_protected_by_backup_plan" {
  name        = "ebs-resources-protected-by-backup-plan"
  description = "Checks whether the Amazon EBS volume is protected by a backup plan."

  source {
    owner             = "AWS"
    source_identifier = "EBS_RESOURCES_PROTECTED_BY_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "ebs_snapshot_public_restorable_check" {
  name        = "ebs-snapshot-public-restorable-check"
  description = "Checks whether the Amazon EBS snapshot is public and restorable."

  source {
    owner             = "AWS"
    source_identifier = "EBS_SNAPSHOT_PUBLIC_RESTORABLE_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_ebs_encryption_by_default" {
  name        = "ec2-ebs-encryption-by-default"
  description = "Checks whether the Amazon EBS encryption by default is enabled for your AWS account."

  source {
    owner             = "AWS"
    source_identifier = "EC2_EBS_ENCRYPTION_BY_DEFAULT"
  }
}

resource "aws_config_config_rule" "ec2_imdsv2_check" {
  name        = "ec2-imdsv2-check"
  description = "Checks whether the EC2 instance metadata version 2 is enabled for your AWS account."

  source {
    owner             = "AWS"
    source_identifier = "EC2_IMDSV2_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_instance_detailed_monitoring_enabled" {
  name        = "ec2-instance-detailed-monitoring-enabled"
  description = "Checks whether the detailed monitoring is enabled for the Amazon EC2 instance."

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_DETAILED_MONITORING_ENABLED"
  }
}

resource "aws_config_config_rule" "ec2_instance_managed_by_systems_manager" {
  name        = "ec2-instance-managed-by-systems-manager"
  description = "Checks whether the Amazon EC2 instance is managed by AWS Systems Manager."

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_MANAGED_BY_SYSTEMS_MANAGER"
  }
}

resource "aws_config_config_rule" "ec2_instance_multiple_eni_check" {
  name        = "ec2-instance-multiple-eni-check"
  description = "Checks whether the Amazon EC2 instance has more than one network interface."

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_MULTIPLE_ENI_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_instance_no_public_ip" {
  name        = "ec2-instance-no-public-ip"
  description = "Checks whether the Amazon EC2 instance does not have a public IP address."

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_NO_PUBLIC_IP"
  }
}

resource "aws_config_config_rule" "ec2_instance_profile_attached" {
  name        = "ec2-instance-profile-attached"
  description = "Checks whether the Amazon EC2 instance profile is attached to the Amazon EC2 instance."

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCE_PROFILE_ATTACHED"
  }
}

resource "aws_config_config_rule" "ec2_last_backup_recovery_point_created" {
  name        = "ec2-last-backup-recovery-point-created"
  description = "Checks whether the last backup recovery point was created for the Amazon EC2 instance."

  source {
    owner             = "AWS"
    source_identifier = "EC2_LAST_BACKUP_RECOVERY_POINT_CREATED"
  }
}

resource "aws_config_config_rule" "ec2_launch_template_public_ip_disabled" {
  name        = "ec2-launch-template-public-ip-disabled"
  description = "Checks whether the Amazon EC2 launch template does not have a public IP address."

  source {
    owner             = "AWS"
    source_identifier = "EC2_LAUNCH_TEMPLATE_PUBLIC_IP_DISABLED"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_applications_blacklisted" {
  name        = "ec2-managedinstance-applications-blacklisted"
  description = "Checks whether the Amazon EC2 managed instance applications are blacklisted."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_APPLICATIONS_BLACKLISTED"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_applications_required" {
  name        = "ec2-managedinstance-applications-required"
  description = "Checks whether the Amazon EC2 managed instance applications are required."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_APPLICATIONS_REQUIRED"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_association_compliance_status_check" {
  name        = "ec2-managedinstance-association-compliance-status-check"
  description = "Checks whether the Amazon EC2 managed instance association compliance status is compliant."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_ASSOCIATION_COMPLIANCE_STATUS_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_inventory_blacklisted" {
  name        = "ec2-managedinstance-inventory-blacklisted"
  description = "Checks whether the Amazon EC2 managed instance inventory is blacklisted."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_INVENTORY_BLACKLISTED"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_patch_compliance_status_check" {
  name        = "ec2-managedinstance-patch-compliance-status-check"
  description = "Checks whether the Amazon EC2 managed instance patch compliance status is compliant."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_PATCH_COMPLIANCE_STATUS_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_managedinstance_platform_check" {
  name        = "ec2-managedinstance-platform-check"
  description = "Checks whether the Amazon EC2 managed instance platform is compliant."

  source {
    owner             = "AWS"
    source_identifier = "EC2_MANAGEDINSTANCE_PLATFORM_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_no_amazon_key_pair" {
  name        = "ec2-no-amazon-key-pair"
  description = "Checks whether the Amazon EC2 key pair is not Amazon EC2."

  source {
    owner             = "AWS"
    source_identifier = "EC2_NO_AMAZON_KEY_PAIR"
  }
}

resource "aws_config_config_rule" "ec2_paravirtual_instance_check" {
  name        = "ec2-paravirtual-instance-check"
  description = "Checks whether the Amazon EC2 instance is a paravirtual instance."

  source {
    owner             = "AWS"
    source_identifier = "EC2_PARAVIRTUAL_INSTANCE_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_resources_protected_by_backup_plan" {
  name        = "ec2-resources-protected-by-backup-plan"
  description = "Checks whether the Amazon EC2 resources are protected by a backup plan."

  source {
    owner             = "AWS"
    source_identifier = "EC2_RESOURCES_PROTECTED_BY_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "ec2_security_group_attached_to_eni" {
  name        = "ec2-security-group-attached-to-eni"
  description = "Checks whether the Amazon EC2 security group is attached to the Amazon EC2 network interface."

  source {
    owner             = "AWS"
    source_identifier = "EC2_SECURITY_GROUP_ATTACHED_TO_ENI"
  }
}

resource "aws_config_config_rule" "ec2_security_group_attached_to_eni_periodic" {
  name        = "ec2-security-group-attached-to-eni-periodic"
  description = "Checks whether the Amazon EC2 security group is attached to the Amazon EC2 network interface periodically."

  source {
    owner             = "AWS"
    source_identifier = "EC2_SECURITY_GROUP_ATTACHED_TO_ENI_PERIODIC"
  }
}

resource "aws_config_config_rule" "ec2_stopped_instance" {
  name        = "ec2-stopped-instance"
  description = "Checks whether the Amazon EC2 instance is stopped."

  source {
    owner             = "AWS"
    source_identifier = "EC2_STOPPED_INSTANCE"
  }
}

resource "aws_config_config_rule" "ec2_token_hop_limit_check" {
  name        = "ec2-token-hop-limit-check"
  description = "Checks whether the Amazon EC2 token hop limit is compliant."

  source {
    owner             = "AWS"
    source_identifier = "EC2_TOKEN_HOP_LIMIT_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_transit_gateway_auto_vpc_attach_disabled" {
  name        = "ec2-transit-gateway-auto-vpc-attach-disabled"
  description = "Checks whether the Amazon EC2 transit gateway auto VPC attach is disabled."

  source {
    owner             = "AWS"
    source_identifier = "EC2_TRANSIT_GATEWAY_AUTO_VPC_ATTACH_DISABLED"
  }
}

resource "aws_config_config_rule" "ec2_volume_inuse_check" {
  name        = "ec2-volume-inuse-check"
  description = "Checks whether the Amazon EC2 volume is in use."

  source {
    owner             = "AWS"
    source_identifier = "EC2_VOLUME_INUSE_CHECK"
  }
}

resource "aws_config_config_rule" "ec2_instances_in_vpc" {
  name        = "ec2-instances-in-vpc"
  description = ""

  source {
    owner             = "AWS"
    source_identifier = "EC2_INSTANCES_IN_VPC"
  }
}
