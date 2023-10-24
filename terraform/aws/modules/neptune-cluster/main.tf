resource "aws_neptune_cluster" "this" {
  allow_major_version_upgrade          = var.allow_major_version_upgrade
  apply_immediately                    = var.apply_immediately
  backup_retention_period              = var.backup_retention_period
  cluster_identifier                   = "${local.stack}-neptune-cluster"
  copy_tags_to_snapshot                = var.copy_tags_to_snapshot
  deletion_protection                  = var.deletion_protection
  enable_cloudwatch_logs_exports       = var.enable_cloudwatch_logs_exports
  engine                               = var.engine
  engine_version                       = var.engine_version
  final_snapshot_identifier            = var.final_snapshot_identifier
  iam_roles                            = var.iam_roles
  iam_database_authentication_enabled  = var.iam_database_authentication_enabled
  kms_key_arn                          = aws_kms_alias.this.arn
  neptune_subnet_group_name            = aws_neptune_subnet_group.this.name
  neptune_cluster_parameter_group_name = var.enable_serverless ? "default.neptune1.2" : module.cluster_parameters.name
  preferred_backup_window              = var.preferred_backup_window
  preferred_maintenance_window         = var.preferred_maintenance_window
  port                                 = var.port
  replication_source_identifier        = var.replication_source_identifier
  skip_final_snapshot                  = var.skip_final_snapshot
  snapshot_identifier                  = var.snapshot_identifier
  storage_encrypted                    = true
  vpc_security_group_ids               = var.vpc_security_group_ids

  dynamic "serverless_v2_scaling_configuration" {
    for_each = var.enable_serverless ? [1] : []

    content {
      max_capacity = var.max_capacity
      min_capacity = var.min_capacity
    }
  }
}

module "cluster_parameters" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/neptune-cluster-parameter-group?ref=neptune-demo"

  app              = var.app
  env              = var.env
  program          = var.program
  enable_audit_log = var.enable_cloudwatch_logs_exports == ["audit"] ? true : false
}

module "instance_parameters" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/neptune-instance-parameter-group?ref=neptune-demo"

  app            = var.app
  env            = var.env
  program        = var.program
  enable_caching = var.serverless_enabled ? false : var.enable_caching
  query_timeout  = var.query_timeout
}

module "neptune_instance" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/neptune-instance?ref=neptune-demo"

  app                          = var.app
  env                          = var.env
  program                      = var.program
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  cluster_identifier           = aws_neptune_cluster.this.cluster_identifier
  engine_version               = var.engine_version
  identifier_prefix            = "${local.stack}-neptune-serverless-instance"
  instance_class               = var.enable_serverless ? "db.serverless" : var.instance_class
  neptune_subnet_group_name    = aws_neptune_subnet_group.this.name
  neptune_parameter_group_name = var.enable_serverless ? "default.neptune1.2" : module.instance_parameters.name
  port                         = var.port
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
}

resource "aws_kms_key" "this" {
  deletion_window_in_days = 7
  description             = "Enforces encryption at rest for the ${terraform.workspace}-tier neptune cluster"
  key_usage               = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "this" {
  name          = "alias/${local.stack}-neptune-key"
  target_key_id = aws_kms_key.this.id
}

resource "aws_neptune_subnet_group" "this" {
  name        = "${local.stack}-neptune-subnets"
  description = "subnet group for the ${var.env}-tier neptune cluster"
  subnet_ids  = var.database_subnet_ids
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.id
  policy = data.aws_iam_policy_document.kms.json
}