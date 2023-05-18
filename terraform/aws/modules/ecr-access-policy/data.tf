data "aws_iam_policy_document" "this" {

  statement {
    sid    = "${var.program}-prod-${var.app}"
    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImages",
      "ecr:ListImages"
    ]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com", "ec2.amazonaws.com"]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.prod_account_id}:root"]
    }

    condition {
      "StringEquals": {
          "${var.access_policy_type}" : "standard"
      }
    }
  }

  statement {
      sid    = "${var.program}-prod-${var.app}"
      effect = "Allow"

      actions = [
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:DescribeImages",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:ListImages",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
      ]

      principals {
        type        = "Service"
        identifiers = ["ecs.amazonaws.com", "ec2.amazonaws.com"]
      }

      principals {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${var.prod_account_id}:root"]
      }

      condition {
        "StringEquals": {
            "${var.access_policy_type}" : "alternate"
        }
      }
    }

  statement {
    sid    = "${var.program}-nonprod-${var.app}"
    effect = "Allow"

    actions = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com", "ec2.amazonaws.com"]
    }

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.nonprod_account_id}:root"]
    }
  }
}
