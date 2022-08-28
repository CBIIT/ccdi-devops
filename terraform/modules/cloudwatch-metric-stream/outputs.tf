output "arn" {
  value = aws_cloudwatch_metric_stream.cw_stream.arn
}

output "output_format" {
  value = aws_cloudwatch_metric_stream.cw_stream.output_format
}

output "name" {
  value = aws_cloudwatch_metric_stream.cw_stream.name
}