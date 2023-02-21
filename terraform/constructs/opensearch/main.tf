module "opensearch" {
  source = "../../modules/opensearch/"

  # Required Variables
  app                 = var.app
  engine_version      = var.engine_version
  hot_node_count      = var.hot_node_count
  hot_node_type       = var.hot_node_type
  master_node_count   = var.master_node_count
  master_node_enabled = var.master_node_enabled
  master_node_type    = var.master_node_type
  multi_az            = var.multi_az
  program             = var.program
  subnet_ids          = var.subnet_ids
  tier                = var.tier

  # Optional Variables
  availability_zone_count        = var.availability_zone_count
  cold_storage_enabled           = var.cold_storage_enabled
  create_domain_policy           = var.create_domain_policy
  custom_domain_endpoint_enabled = var.custom_domain_endpoint_enabled
  ebs_enabled                    = var.ebs_enabled
  ebs_iops                       = var.ebs_iops
  ebs_throughput                 = var.ebs_throughput
  ebs_volume_size                = var.ebs_volume_size
  ebs_volume_type                = var.ebs_volume_type
  enable_os_application_logs     = var.enable_os_application_logs
  enable_os_index_slow_logs      = var.enable_os_index_slow_logs
  enable_os_search_slow_logs     = var.enable_os_search_slow_logs
  enforce_https                  = var.enforce_https
  iam_prefix                     = var.iam_prefix
  log_retention                  = var.log_retention
  opensearch_security_group_id   = [module.opensearch_security_group.id]
  snapshot_hour                  = var.snapshot_hour
  warm_node_count                = var.warm_node_count
  warm_node_enabled              = var.warm_node_enabled
  warm_node_type                 = var.warm_node_type
}

module "opensearch_security_group" {
  source = "../../modules/security-groups/opensearch/"

  allow_nih_access = var.allow_nih_access
  app              = var.app
  program          = var.program
  tier             = var.tier
  vpc_id           = var.vpc_id
  //  ecs_security_group_id = var.ecs_security_group_id
  //  jenkins_IP       = var.jenkins_IP
}
