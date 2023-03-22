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
  db_name                               = "${local.stack}-${var.rds_suffix}"
  db_subnet_group_name                  = var.create_db_subnet_group ? aws_db_subnet_group.this[0].name : var.db_subnet_group_name
  delete_automated_backups              = true
  deletion_protection                   = var.deletion_protection
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  engine                                = "mysql"
  engine_version                        = var.engine_version
  final_snapshot_identifier             = ""
  iam_database_authentication_enabled   = ""
  identifier                            = ""
  identifier_prefix                     = ""
  instance_class                        = ""
  iops                                  = ""
  kms_key_id                            = ""
  license_model                         = ""
  maintenance_window                    = ""
  max_allocated_storage                 = ""
  monitoring_interval                   = ""
  monitoring_role_arn                   = ""
  multi_az                              = ""
  nchar_character_set_name              = null
  netwok_type                           = "IPV4"
  option_group_name                     = ""
  parameter_group_name                  = ""
  password                              = ""
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = ""
  performance_insights_retention_period = ""
  port                                  = ""
  publicly_accessible                   = ""
  replica_mode                          = ""
  replica_source_db                     = ""

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
  skip_final_snapshot       = ""
  snapshot_identifier       = ""
  storage_encrypted         = ""
  storage_type              = ""
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