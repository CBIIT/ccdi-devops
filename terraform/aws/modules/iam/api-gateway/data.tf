data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  statement {
    sid     = "apiGatewayTrustPolicy"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "apigateway.amazonaws.com",
        "ops.apigateway.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    sid    = "apiGatewayLogPrivileges"
    effect = "Allow"
    actions = [
      "logs:CreateLogDelivery",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DeleteLogDelivery",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogDelivery",
      "logs:GetLogEvents",
      "logs:ListLogDeliveries",
      "logs:PutLogEvents",
      "logs:UpdateLogDelivery"
    ]
    resources = ["arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*"]
  }

  statement {
    sid    = "apiGatewayXrayPrivileges"
    effect = "Allow"
    actions = [
      "xray:PutTraceSegments",
      "xray:PutTelemetryRecords",
      "xray:GetSamplingRules",
      "xray:GetSamplingTargets"
    ]
    resources = [
      "arn:aws:xray:us-east-1:${data.aws_caller_identity.current.account_id}:group/*",
      "arn:aws:xray:us-east-1:${data.aws_caller_identity.current.account_id}:sampling-rule/*"
    ]
  }

  statement {
    sid    = "apiGatewayELBPrivileges"
    effect = "Allow"
    actions = [
      "elasticloadbalancing:AddListenerCertificates",
      "elasticloadbalancing:RemoveListenerCertificates",
      "elasticloadbalancing:ModifyListener",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeLoadBalancers",
      "servicediscovery:DiscoverInstances"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "apiGatewayKinesisPrivileges"
    effect = "Allow"
    actions = [
      "firehose:DescribeDeliveryStream",
      "firehose:PutRecord",
      "firehose:PutRecordBatch"
    ]
    resources = [
      "arn:aws:firehose:us-east-1:${data.aws_caller_identity.current.account_id}:deliverystream/*"
    ]
  }

  statement {
    sid    = "apiGatewayACMPrivileges"
    effect = "Allow"
    actions = [
      "acm:DescribeCertificate",
      "acm:GetCertificate"
    ]
    resources = [
      "arn:aws:acm:us-east-1:${data.aws_caller_identity.current.account_id}:certificate/*"
    ]
  }

  statement {
    sid    = "apiGatewayENIPrivileges"
    effect = "Allow"
    actions = [
      "arn:aws:ec2:us-east-1:${data.aws_caller_identity.current.account_id}:network-interface/*"
    ]
    condition {
      test     = "ForAllValues:StringEquals"
      variable = "aws:TagKeys"
      values   = ["Owner", "VpcLinkId"]
    }
  }

  statement {
    sid    = "apiGatewayNetworkPrivileges"
    effect = "Allow"
    actions = [
      "ec2:ModifyNetworkInterfaceAttribute",
      "ec2:DeleteNetworkInterface",
      "ec2:AssignPrivateIpAddresses",
      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeNetworkInterfaceAttribute",
      "ec2:DescribeVpcs",
      "ec2:DescribeNetworkInterfacePermissions",
      "ec2:UnassignPrivateIpAddresses",
      "ec2:DescribeSubnets",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "apiGatewayServiceDiscPrivileges"
    effect = "Allow"
    actions = [
      "servicediscovery:GetNamespace",
      "servicediscovery:GetService",
    ]
    resources = [
      "arn:aws:servicediscovery:us-east-1:${data.aws_caller_identity.current.account_id}:namespace/*",
      "arn:aws:servicediscovery:us-east-1:${data.aws_caller_identity.current.account_id}:service/*"
    ]
  }


}