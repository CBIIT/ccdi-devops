data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trust" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "es.amazonaws.com",
        "opensearch.amazonaws.com"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

data "aws_iam_policy_document" "service_linked_role_policy" {

  statement {
    sid    = "OpenSearchServicePolicy1"
    effect = "Allow"
    actions = [
      "ec2:CreateNetworkInterface"
    ]

    resources = [
      "arn:aws:ec2:us-east-1:*:network-interface/*",
      "arn:aws:ec2:us-east-1:*:subnet/*",
      "arn:aws:ec2:us-east-1:*:security-group/*"
    ]
  }

  statement {
    sid    = "OpenSearchServicePolicy3"
    effect = "Allow"
    actions = [
      "ec2:DeleteNetworkInterface",
      "ec2:CreateTags"
    ]
    resources = [
      "arn:aws:ec2:us-east-1:*:network-interface/*"
    ]
  }

  statement {
    sid    = "OpenSearchServicePolicy4"
    effect = "Allow"
    actions = [
      "ec2:ModifyNetworkInterfaceAttribute"
    ]
    resources = [
      "arn:aws:ec2:us-east-1:*:network-interface/*",
      "arn:aws:ec2:us-east-1:*:security-group/*"
    ]
  }

  statement {
    sid    = "OpenSearchServicePolicy5"
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeSubnets",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeVpcs",
      "ec2:DescribeTags",
      "ec2:DescribeVpcEndpoints"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "OpenSearchServicePolicy6"
    effect = "Allow"
    actions = [
      "elasticloadbalancing:AddListenerCertificates",
      "elasticloadbalancing:RemoveListenerCertificates"
    ]
    resources = [
      "arn:aws:elasticloadbalancing:*:*:listener/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVpcEndpoint",
      "ec2:ModifyVpcEndpoint"
    ]
    resources = [
      "arn:aws:ec2:*:*:vpc/*",
      "arn:aws:ec2:*:*:security-group/*",
      "arn:aws:ec2:*:*:subnet/*",
      "arn:aws:ec2:*:*:route-table/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "acm:DescribeCertificate"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:PutMetricData"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "cloudwatch:namespace"
      values   = ["AWS/ES"]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateVpcEndpoint"
    ]
    resources = [
      "arn:aws:ec2:*:*:vpc-endpoint/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/OpenSearchManaged"
      values   = ["true"]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:ModifyVpcEndpoint",
      "ec2:DeleteVpcEndpoints"
    ]
    resources = [
      "arn:aws:ec2:us-east-1:*:vpc-endpoint/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateTags"
    ]
    resources = [
      "arn:aws:ec2:us-east-1:*:vpc-endpoint/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values   = ["CreateVpcEndpoint"]
    }
  }
}

data "aws_iam_policy_document" "snapshot" {
  count = var.create_manual_snapshot_role ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [var.snapshot_bucket_arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = ["${var.snapshot_bucket_arn}/*"]
  }
}