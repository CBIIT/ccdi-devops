locals {
  stack = "${var.program}-${var.env}-${var.app}"

  access_point_alias = var.create_access_point ? module.access_point[0].alias : "access point was not created"
  access_point_arn = var.create_access_point ? module.access_point[0].arn : "access point was not created"
  access_point_domain_name = var.create_access_point ? module.access_point[0].domain_name : "access point was not created"
  access_point_endpoints = var.create_access_point ? module.access_point[0].endpoints : "access point was not created"
  access_point_id = var.create_access_point ? module.access_point[0].id : "access point was not created"
  access_point_name = var.create_access_point ? module.access_point[0].name : "access point was not created"
}
