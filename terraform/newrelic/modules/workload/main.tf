resource "newrelic_workload" "this" {
  account_id = var.account_id
  name       = local.stack

  entity_search_query {
    query = local.workload_query
  }
}
