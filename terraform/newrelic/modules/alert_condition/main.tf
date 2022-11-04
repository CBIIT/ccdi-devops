resource "newrelic_nrql_alert_condition" "this" {
  account_id                     = var.account_id
  policy_id                      = var.policy_id
  type                           = var.type
  name                           = var.name
  description                    = var.description
  runbook_url                    = var.runbook_url
  enabled                        = var.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds
  fill_option                    = var.fill_option
  fill_value                     = var.fill_value
  aggregation_window             = var.aggregation_window
  aggregation_method             = var.aggregation_method
  aggregation_delay              = var.aggregation_delay
  expiration_duration            = var.expiration_duration
  open_violation_on_expiration   = var.open_violation_on_expiration
  close_violations_on_expiration = var.close_violations_on_expiration
  slide_by                       = var.slide_by

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
  }

  critical {
    operator              = "string"
    threshold             = 1
    threshold_duration    = 2
    threshold_occurrences = "ALL"
  }

  dynamic "critical" {
    for_each = var.critical

    content {
      operator              = each.value["operator"]
      threshold             = each.value["threshold"]
      threshold_duration    = each.value["threshold_duration"]
      threshold_occurrences = each.value["threshold_occurances"]
    }
  }

  dynamic "warning" {
    for_each = var.warning

    content {
      operator              = each.value["operator"]
      threshold             = each.value["threshold"]
      threshold_duration    = each.value["threshold_duration"]
      threshold_occurrences = each.value["threshold_occurances"]
    }
  }
}
