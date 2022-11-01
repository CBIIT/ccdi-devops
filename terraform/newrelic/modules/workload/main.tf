resource "newrelic_workload" "this" {
  account_id  = var.new_relic_account_id
  name        = "${var.program}-${var.tier}-${var.app}"
  
  entity_search_query {
    query = local.workload_query
  }
}
