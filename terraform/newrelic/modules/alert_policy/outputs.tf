output "policy_id" {
  value       = newrelic_alert_policy.this.id
  description = "The alert policy id"
}

output "policy_name" {
  value       = newrelic_alert_policy.this.name
  description = "The alert policy name"
}
