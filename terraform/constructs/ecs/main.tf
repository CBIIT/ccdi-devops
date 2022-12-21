module "ecs_autoscaling_frontend_target" {
  source             = "../../modules/ecs-auto-scaling/"
  resource_id        = "service/${module.ecs_cluster.name}/${module.ecs_service_frontend.name}"
}

module "ecs_autoscaling_backend_target" {
  source             = "../../modules/ecs-auto-scaling/"
  resource_id        = "service/${module.ecs_cluster.name}/${module.ecs_service_backend.name}"
}

module "ecs_cluster" {
  source                     = "../../modules/ecs-cluster/"
  program                    = var.program
  tier                       = var.tier
  app                        = var.app
  container_insights_enabled = "enabled"
}

module "ecs_service_frontend"{
  source                             = "../../modules/ecs-service/"
  cluster_id                         = module.ecs_cluster.id
  program                            = var.program
  app                                = var.app
  tier                               = var.tier
  ecs_service_name                   = "frontend"
  task_definition                    = module.ecs_frontend_task_definition.arn
  desired_count                      = var.desired_count
  launch_type                        = var.launch_type
  scheduling_strategy                = var.scheduling_strategy
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  assign_public_ip                   = var.assign_public_ip
  security_group_ids                    = [module.security_group.ecs_security_group_id]
  webapp_subnets                            = var.webapp_subnets
  target_group_arn                   = var.frontend_target_group_arn
  container_name                     = var.frontend_container_name
  container_port                     = var.frontend_container_port

}

module "ecs_service_backend"{
  source                             = "../../modules/ecs-service"
  cluster_id                         = module.ecs_cluster.id
  program                            = var.program
  app                                = var.app
  tier                               = var.tier
  ecs_service_name                   = "backend"
  task_definition                    = module.ecs_backend_task_definition.arn
  desired_count                      = var.desired_count
  launch_type                        = var.launch_type
  scheduling_strategy                = var.scheduling_strategy
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  assign_public_ip                   = var.assign_public_ip
  security_group_ids                 = [module.security_group.ecs_security_group_id]
  target_group_arn                   = var.backend_target_group_arn
  container_name                     = var.backend_container_name
  container_port                     = var.backend_container_port
  webapp_subnets                     = var.webapp_subnets
}

module "ecs_frontend_task_definition" {
  source                             = "../../modules/ecs-task-definition/"
  program                            = var.program
  app                                = var.app
  tier                               = var.tier
  family                             = "frontend"
  requires_compatibilities           = "FARGATE"
  network_mode                       = var.ecs_network_mode
  cpu                                = var.frontend_cpu
  memory                             = var.frontend_memory
  execution_role_arn                 = var.execution_role_arn
  task_role_arn                      = var.task_role_arn
  container_definition_name          = "frontend"
  container_definition_image         = var.frontend_definition_image
  container_definition_essential     = true
  container_port                     = var.frontend_container_port
  host_port                          = var.frontend_container_port
}

module "ecs_backend_task_definition" {
  source                             = "../../modules/ecs-task-definition/"
  program                            = var.program
  app                                = var.app
  tier                               = var.tier
  family                             = "backend"
  requires_compatibilities           = "FARGATE"
  network_mode                       = var.ecs_network_mode
  cpu                                = var.backend_cpu
  memory                             = var.backend_memory
  execution_role_arn                 = var.execution_role_arn
  task_role_arn                      = var.task_role_arn
  container_definition_name          = "backend"
  container_definition_image         = var.backend_definition_image
  container_definition_essential     = true
  container_port                     = var.backend_container_port
  host_port                          = var.backend_container_port
}

module "security_group" {
  source = "../../modules/security-groups/ecs/"
  app                         = var.app
  program                     = var.program
  tier                        = var.tier
  vpc_id                      = var.vpc_id
}