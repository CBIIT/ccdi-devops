output "prod_guid" {
  value = newrelic_workload.prod.guid
}

output "stage_guid" {
  value = newrelic_workload.stage.guid
}

output "qa_guid" {
  value = newrelic_workload.qa.guid
}

output "dev_guid" {
  value = newrelic_workload.dev.guid
}


output "prod_workload_id" {
  value = newrelic_workload.prod.workload_id
}

output "stage_workload_id" {
  value = newrelic_workload.stage.workload_id
}

output "qa_workload_id" {
  value = newrelic_workload.qa.workload_id
}

output "dev_workload_id" {
  value = newrelic_workload.dev.workload_id
}
