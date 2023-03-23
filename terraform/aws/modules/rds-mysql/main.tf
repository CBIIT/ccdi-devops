resource "aws_db_instance" "this" {
  allocated_storage                     = var.allocated_storage
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  ca_cert_identifier                    = var.ca_cert_identifier
  copy_tags_to_snapshot                 = true
  db_name                               = var.db_name
  db_subnet_group_name                  = var.create_db_subnet_group ? aws_db_subnet_group.this[0].name : var.db_subnet_group_name
  delete_automated_backups              = true
  deletion_protection                   = var.deletion_protection
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  engine                                = "mysql"
  engine_version                        = var.engine_version
  final_snapshot_identifier             = "${local.stack}-rds-snapshot-final"
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  identifier                            = "${local.stack}-${var.rds_suffix}"
  instance_class                        = var.instance_class
  iops                                  = var.iops
  kms_key_id                            = ""
  maintenance_window                    = var.maintenance_window
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.enable_enhanced_monitoring ? aws_iam_role.this[0].arn : null
  multi_az                              = var.multi-az
  netwok_type                           = "IPV4"
  parameter_group_name                  = ""
  password                              = var.password
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = ""
  performance_insights_retention_period = var.performance_insights_retention_period
  port                                  = 3306
  publicly_accessible                   = false

  blue_green_update {
    enabled = true
  }

  restore_to_point_in_time {
    source_db_identifier       = ""
    restore_time               = ""
    use_latest_restorable_time = ""
  }
  s3_import {
    bucket_name           = ""
    bucket_prefix         = ""
    ingestion_role        = ""
    source_engine         = ""
    source_engine_version = ""
    ingestion_role_arn    = ""
  }
  skip_final_snapshot       = false
  storage_encrypted         = ""
  storage_type              = var.storage_type
  storage_throughput        = ""
  tags                      = ""
  timezone                  = ""
  username                  = ""
  vpc_security_group_ids    = ["value"]
  customer_owned_ip_enabled = ""
}

resource "aws_db_subnet_group" "this" {
  count = var.create_db_subnet_group ? 1 : 0

  name        = "${local.stack}-rds-subnet-group"
  description = "Subnet group for ${local.stack} RDS instance"
  subnet_ids  = var.db_subnet_group_subnet_ids

  tags = {
    Name = "${local.stack}-rds-subnet-group"
  }
}

resource "aws_iam_role" "this" {
  count = var.enable_enhanced_monitoring ? 1 : 0

  name                 = "power-user-${local.stack}-rds-enhanced-monitoring-role"
  description          = "role for enhanced monitoring of ${local.stack} rds instance"
  assume_role_policy   = data.aws_iam_policy_document.trust[0].json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  count       = var.enable_enhanced_monitoring ? 1 : 0
  name        = "power-user-${local.stack}-rds-enhanced-monitoring-policy"
  description = "policy for enhanced monitoring of ${local.stack} rds instance"
  policy      = data.aws_iam_policy_document.this[0].json
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.enable_enhanced_monitoring ? 1 : 0

  policy_arn = aws_iam_policy.this[0].arn
  role       = aws_iam_role.this[0].name
}