resource "newrelic_alert_policy" "this" {
  account_id          = var.account_id
  name                = var.name
  incident_preference = var.incident_preference
}
