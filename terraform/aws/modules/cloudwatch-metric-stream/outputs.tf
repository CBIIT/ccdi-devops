output "arn" {
  value       = aws_cloudwatch_metric_stream.cw_stream.arn
  description = "arn of the metric stream"
}

output "id" {
  value       = aws_cloudwatch_metric_stream.cw_stream.id
  description = "id of the metric stream"
}

output "name" {
  value       = aws_cloudwatch_metric_stream.cw_stream.name
  description = "name of the metric stream"
}

output "state" {
  value       = aws_cloudwatch_metric_stream.cw_stream.state
  description = "state of the metric stream - either 'ACTIVE' or 'CREATING'"
}
