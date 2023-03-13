output "arn" {
  value       = aws_kinesis_firehose_delivery_stream.kinesis.arn
  description = "arn of the kinesis firehose delivery stream"
  sensitive   = false
}

output "destination" {
  value       = aws_kinesis_firehose_delivery_stream.kinesis.destination
  description = "destination of data processed through the kinesis firehose delivery stream"
  sensitive   = false
}

output "id" {
  value       = aws_kinesis_firehose_delivery_stream.kinesis.id
  description = "id of the kinesis firehose delivery stream"
  sensitive   = false
}

output "name" {
  value       = aws_kinesis_firehose_delivery_stream.kinesis.name
  description = "name of the kinesis firehose delivery stream"
  sensitive   = false
}

output "version_id" {
  value       = aws_kinesis_firehose_delivery_stream.kinesis.version_id
  description = "version id of the kinesis firehose delivery stream"
  sensitive   = false
}
