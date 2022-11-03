resource "newrelic_nrql_alert_condition" "this" {
    account_id = var.account_id 
    policy_id = var.policy_id 
    type = var.type 
    name = var.name 
    description = var.description 
    runbook_url = var.runbook_url 
    enabled = var.enabled 
    violation_time_limit_seconds = var.violation_time_limit_seconds 
    fill_option = var.fill_option
    fill_value = var.fill_value
    aggregation_window = var.aggregation_window 
    aggregation_method = var.aggregation_method 
    aggregation_delay = var.aggregation_delay 
    expiration_duration = var.expiration_duration 
    open_violation_on_expiration = var.open_violation_on_expiration 
    close_violations_on_expiration = var.close_violations_on_expiration 
    slide_by = var.slide_by
    
    
}

variable "type" {
    type = string 
    description = "The type of condition - either apm_app_metric, apm_java_metric, apm_kt_metric, browser_metric, or mobile_metric"
}