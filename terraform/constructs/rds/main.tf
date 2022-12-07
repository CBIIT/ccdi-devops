module "rds_instance" {
  source = "../../modules/rds/"
  identifier           = var.identifier
  security_group_ids   = [module.rds_security_group.id]
  database_user        = var.database_user
  database_password    = var.database_password
  database_port        = var.database_port
  multi_az             = var.multi_az
  storage_type         = var.storage_type
  allocated_storage    = var.allocated_storage
  storage_encrypted    = var.storage_encrypted
  engine               = var.engine
  engine_version       = var.engine_version
  major_engine_version = var.major_engine_version
  instance_class       = var.instance_class
  db_parameter_group   = var.db_parameter_group
  publicly_accessible  = var.publicly_accessible
  subnet_ids                  = var.db_subnet_ids
  vpc_id                      = var.vpc_id
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  allow_major_version_upgrade = var.allow_major_version_upgrade
  apply_immediately           = var.apply_immediately
  skip_final_snapshot         = var.skip_final_snapshot
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  backup_retention_period     = var.backup_retention_period
  backup_window               = var.backup_window

  db_subnet_id_name = var.db_subnet_id_name
  env               = var.tier
  tags = var.tags
}


module "rds_security_group" {
  source = "../../modules/security-groups/rds/"

  app              = var.app
  program          = var.program
  tier             = var.tier
  vpc_id           = var.vpc_id
#  jenkins_ip       = var.jenkins_ip
}
