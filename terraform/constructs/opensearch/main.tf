module "opensearch" {
  source = "../../modules/opensearch/"

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
}

module "opensearch_config" {
  source = "../../modules/config/opensearch/"
}