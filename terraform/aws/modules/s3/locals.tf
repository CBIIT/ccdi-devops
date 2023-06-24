locals {
  stack = "${var.program}-${var.env}-${var.app}"

  access_point_alias       = var.access_point_enabled ? module.access_point[0].alias : "access point was not created"
  access_point_arn         = var.access_point_enabled ? module.access_point[0].arn : "access point was not created"
  access_point_domain_name = var.access_point_enabled ? module.access_point[0].domain_name : "access point was not created"
  access_point_endpoints   = var.access_point_enabled ? module.access_point[0].endpoints : tomap({ "access point created" = "false" })
  access_point_id          = var.access_point_enabled ? module.access_point[0].id : "access point was not created"
  access_point_name        = var.access_point_enabled ? module.access_point[0].name : "access point was not created"
}
