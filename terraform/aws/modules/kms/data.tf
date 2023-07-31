data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyPair",
      "kms:GenerateDataKeyWithoutPlaintext",
      "kms:GenerateDataKeyPairWithoutPlaintext",
      "kms:ReEncryptFrom",
      "kms:ReEncryptTo",
      "kms:DescribeKey"
    ]
    resources = [
      aws_kms_key.this.arn
    ]

    principals {
      type = "Service"
      identifiers = [
        "logs.us-east-1.amazonaws.com"
      ]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:GenerateRandom",
    ]
    resources = [
      "*"
    ]
    principals {
      type = "Service"
      identifiers = [
        "logs.us-east-1.amazonaws.com"
      ]
    }
  }
}
