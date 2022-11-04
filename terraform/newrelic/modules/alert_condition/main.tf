



resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = var.account_id
  policy_id                      = var.policy_id
  type                           = var.type
  name                           = ""
  description                    = var.description
  runbook_url                    = var.runbook_url
  enabled                        = var.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds
  fill_option                    = var.fill_option
  fill_value                     = var.fill_value
  aggregation_window             = var.aggregation_window
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}