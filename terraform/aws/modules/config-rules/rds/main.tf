resource "aws_config_config_rule" "rds_automatic_minor_version_upgrade_enabled" {
  name = "rds-automatic-minor-version-upgrade-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_AUTOMATIC_MINOR_VERSION_UPGRADE_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_cluster_default_admin_check" {
  name = "rds-cluster-default-admin-check"

  source {
    owner             = "AWS"
    source_identifier = "RDS_CLUSTER_DEFAULT_ADMIN_CHECK"
  }
}

resource "aws_config_config_rule" "rds_cluster_deletion_protection_enabled" {
  name = "rds-cluster-deletion-protection-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_CLUSTER_DELETION_PROTECTION_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_cluster_iam_authentication_enabled" {
  name = "rds-cluster-iam-authentication-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_CLUSTER_IAM_AUTHENTICATION_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_cluster_multi_az_enabled" {
  name = "rds-cluster-multi-az-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_CLUSTER_MULTI_AZ_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_db_security_group_not_allowed" {
  name = "rds-db-security-group-not-allowed"

  source {
    owner             = "AWS"
    source_identifier = "RDS_DB_SECURITY_GROUP_NOT_ALLOWED"
  }
}

resource "aws_config_config_rule" "rds_enhanced_monitoring_enabled" {
  name = "rds-enhanced-monitoring-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_ENHANCED_MONITORING_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_instance_default_admin_check" {
  name = "rds-instance-default-admin-check"

  source {
    owner             = "AWS"
    source_identifier = "RDS_INSTANCE_DEFAULT_ADMIN_CHECK"
  }
}

resource "aws_config_config_rule" "rds_instance_deletion_protection_enabled" {
  name = "rds-instance-deletion-protection-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_INSTANCE_DELETION_PROTECTION_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_instance_iam_authentication_enabled" {
  name = "rds-instance-iam-authentication-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_INSTANCE_IAM_AUTHENTICATION_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_instance_public_access_check" {
  name = "rds-instance-public-access-check"

  source {
    owner             = "AWS"
    source_identifier = "RDS_INSTANCE_PUBLIC_ACCESS_CHECK"
  }
}

resource "aws_config_config_rule" "rds_in_backup_plan" {
  name = "rds-in-backup-plan"

  source {
    owner             = "AWS"
    source_identifier = "RDS_IN_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "rds_last_backup_recovery_point_created" {
  name = "rds-last-backup-recovery-point-created"

  source {
    owner             = "AWS"
    source_identifier = "RDS_LAST_BACKUP_RECOVERY_POINT_CREATED"
  }
}

resource "aws_config_config_rule" "rds_logging_enabled" {
  name = "rds-logging-enabled"

  source {
    owner             = "AWS"
    source_identifier = "RDS_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "rds_multi_az_support" {
  name = "rds-multi-az-support"

  source {
    owner             = "AWS"
    source_identifier = "RDS_MULTI_AZ_SUPPORT"
  }
}

resource "aws_config_config_rule" "rds_resources_protected_by_backup_plan" {
  name = "rds-resources-protected-by-backup-plan"

  source {
    owner             = "AWS"
    source_identifier = "RDS_RESOURCES_PROTECTED_BY_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "rds_snapshots_public_prohibited" {
  name = "rds-snapshots-public-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "RDS_SNAPSHOTS_PUBLIC_PROHIBITED"
  }
}

resource "aws_config_config_rule" "rds_snapshot_encrypted" {
  name = "rds-snapshot-encrypted"

  source {
    owner             = "AWS"
    source_identifier = "RDS_SNAPSHOT_ENCRYPTED"
  }
}

resource "aws_config_config_rule" "rds_storage_encrypted" {
  name = "rds-storage-encrypted"

  source {
    owner             = "AWS"
    source_identifier = "RDS_STORAGE_ENCRYPTED"
  }
}
