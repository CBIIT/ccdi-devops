resource "newrelic_workload" "prod" {
  account_id = var.account_id
  name       = "${var.program}-prod-${var.app}"

  entity_search_query {
    query = local.query_prod
  }
}

resource "newrelic_workload" "stage" {
  account_id = var.account_id
  name       = "${var.program}-stage-${var.app}"

  entity_search_query {
    query = local.query_stage
  }
}

resource "newrelic_workload" "qa" {
  account_id = var.account_id
  name       = "${var.program}-qa-${var.app}"

  entity_search_query {
    query = local.query_qa
  }
}

resource "newrelic_workload" "dev" {
  account_id = var.account_id
  name       = "${var.program}-dev-${var.app}"

  entity_search_query {
    query = local.query_dev
  }
}

