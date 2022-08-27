locals {
  permission_boundary_arn = var.level == "prod" ? "arn:aws:iam::${var.account_id}:policy/PermissionBoundary_PowerUser" : null
}

data "aws_caller_identity" "current" {}


resource "aws_iam_role" "cw_stream_to_firehose" {
  name =  "${var.program}-${var.app}-${var.level}-cloudwatch-stream-to-firehose"
  description =  "Allows CloudWatch Streams to send metric streams to Kinesis Data Firehose Delivery Streams"
  force_detach_policies =  false
  assume_role_policy = data.aws_iam_policy_document.cw_stream_to_firehose_assume_role.json
  permissions_boundary = local.permissions_boundary_arn
}

data "aws_iam_policy_document" "cw_stream_to_firehose_assume_role" {
  statement {
    effect = "Allow"
    actions = [ "sts:AssumeRole" ]
    principals {
      type = "Service" 
      identifiers = [ "streams.metrics.cloudwatch.amazonaws.com" ]
    }
  }
}



variable "iam_prefix" {
  type = string 
  default = "power-user"
}