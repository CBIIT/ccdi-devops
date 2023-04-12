resource "aws_rds_cluster" "this" {
  cluster_identifier                  = "${local.stack}-${var.rds_suffix}"
  engine                              =  var.db_engine_type
  engine_version                      =  var.db_engine_version
  engine_mode                         =  var.db_engine_mode
  database_name                       =   var.database_name
  master_username                     =  var.master_username
  master_password                     =  random_password.master_password.result
  final_snapshot_identifier           =  local.snapshot_name
  skip_final_snapshot                 =  false
  backup_retention_period             =  var.backup_retention_period
  preferred_backup_window             =  var.backup_window
  preferred_maintenance_window        =  var.maintenance_window
  port                                =  3306
  storage_encrypted                   =  true
  allow_major_version_upgrade         =  var.allow_major_version_upgrade
  enabled_cloudwatch_logs_exports     =  var.enabled_cloudwatch_logs_exports
  deletion_protection                 =  var.deletion_protection
  db_subnet_group_name                =  var.create_db_subnet_group ? aws_db_subnet_group.this[0].name : var.db_subnet_group_name
  vpc_security_group_ids              =  var.create_security_group ? [aws_security_group.this[0].id] : var.vpc_security_group_ids
  kms_key_id                          =  data.aws_kms_alias.kms.id
  serverlessv2_scaling_configuration {
    max_capacity =  var.max_capacity
    min_capacity =  var.min_capacity
  }
  tags = var.tags

  lifecycle {
    ignore_changes = [
      kms_key_id
    ]
  }
}

resource "aws_rds_cluster_instance" "this" {
  cluster_identifier = aws_rds_cluster.this.cluster_identifier
  instance_class     = var.db_instance_class
  engine             = aws_rds_cluster.this.engine
  engine_version     = aws_rds_cluster.this.engine_version
  tags               = var.tags
}

resource "aws_db_subnet_group" "this" {
  count = var.create_db_subnet_group ? 1 : 0

  name        = "${local.stack}-rds-aurora-subnet-group"
  description = "Subnet group for ${local.stack} RDS Aurora instance"
  subnet_ids  = var.db_subnet_ids
  tags = {
    Name = "${local.stack}-rds-subnet-group"
  }
}

resource "random_password" "master_password" {
  length  = var.master_password_length
  special = false
  keepers = {
    Name =  var.master_username
  }
}

resource "random_id" "snapshot" {
  byte_length = 3
  keepers = {
    Name = local.stack
  }
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name  =  "${local.stack}-rds-aurora-sg"
  vpc_id      = var.vpc_id
  description = "Allow traffic to/from RDS Aurora"
  tags = var.tags
}

resource "aws_security_group_rule" "rds_inbound" {
  count = var.create_security_group ? 1 : 0

  description              = "From allowed SGs"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  cidr_blocks              = local.ranges
  security_group_id        = aws_security_group.this[0].id
}


resource "aws_security_group_rule" "egress" {
  count = var.create_security_group ? 1 : 0

  description       = "allow all outgoing traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id =  aws_security_group.this[0].id
}
