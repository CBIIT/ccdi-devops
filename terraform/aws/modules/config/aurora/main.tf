resource "aws_config_config_rule" "aurora_last_backup_recovery_point_created" {
  count = var.enable_periodic_rules ? 1 : 0

  name = "aurora-last-backup-recovery-point-created"
  description = "Checks whether the last backup recovery point was created for the Amazon Aurora database cluster."

  source {
    owner             = "AWS"
    source_identifier = "AURORA_LAST_BACKUP_RECOVERY_POINT_CREATED"
  }

  tags = {
    triggerType = "schedule"
  }
}

resource "aws_config_config_rule" "aurora_mysql_backtracking_enabled" {
  name = "aurora-mysql-backtracking-enabled"
  description = "Checks whether the backtracking is enabled for the Amazon Aurora MySQL database cluster."

  source {
    owner             = "AWS"
    source_identifier = "AURORA_MYSQL_BACKTRACKING_ENABLED"
  }

  tags = {
    triggerType = "changes"
  }
}

resource "aws_config_config_rule" "aurora_resources_protected_by_backup_plan" {
  count = var.enable_periodic_rules ? 1 : 0
  
  name = "aurora-resources-protected-by-backup-plan"
  description = "Checks whether the Amazon Aurora database cluster is protected by a backup plan."

  source {
    owner             = "AWS"
    source_identifier = "AURORA_RESOURCES_PROTECTED_BY_BACKUP_PLAN"
  }

  tags = {
    triggerType = "schedule"
  }
}
