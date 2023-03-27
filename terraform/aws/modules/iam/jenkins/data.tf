data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }

}

data "aws_iam_policy_document" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "ecr:DescribeRegistry",
      "ecr:GetAuthorizationToken",
      "ecr:GetRegistryPolicy"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    resources = var.ecr_repository_arns
  }
}

data "aws_iam_policy_document" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "ecs:DeregisterContainerInstance",
      "ecs:DescribeClusters",
      "ecs:ListAttributes",
      "ecs:ListContainerInstances",
      "ecs:ListTagsForResource",
      "ecs:RegisterContainerInstance",
      "ecs:SubmitAttachmentStateChanges",
      "ecs:SubmitContainerStateChange",
      "ecs:SubmitTaskStateChange",
      "ecs:TagResource",
      "ecs:UntagResource",
      "ecs:UpdateCluster",
      "ecs:UpdateClusterSettings",
    ]
    resources = [
      "arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:cluster/*"
    ]

  }

  statement {
    effect = "Allow"
    actions = [
      "ecs:DeleteAttributes",
      "ecs:DescribeContainerInstances",
      "ecs:ListTagsForResource",
      "ecs:ListTasks",
      "ecs:Poll",
      "ecs:PutAttributes",
      "ecs:StartTelemetrySession",
      "ecs:TagResource",
      "ecs:UntagResource",
      "ecs:UpdateContainerAgent",
      "ecs:updateContainerInstancesState"
    ]

    resources = [
      "arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:container-instance/*/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecs:ListTagsForResource",
      "ecs:RunTask",
      "ecs:StartTask",
      "ecs:TagResource",
      "ecs:UntagResource"
    ]
    resources = [
      "arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:task-definition/*:*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecs:CreateService",
      "ecs:DeleteService",
      "ecs:DescribeServices",
      "ecs:TagResource",
      "ecs:UntagResource",
      "ecs:UpdateService",
    ]
    resources = ["arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:service/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecs:DescribeTasks",
      "ecs:StopTask",
      "ecs:ExecuteCommand",
      "ecs:ListTagsForResource",
      "ecs:TagResource",
      "ecs:UntagResource",
    ]
    resources = [
      "arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:task/*/*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecs:ListClusters",
      "ecs:ListServices",
      "ecs:DescribeTaskDefinition",
      "ecs:DeregisterTaskDefinition",
      "ecs:DiscoverPollEndpoint",
      "ecs:ListClusters",
      "ecs:ListServices",
      "ecs:ListTaskDefinitionFamilies",
      "ecs:ListTaskDefinitions",
      "ecs:ListTasks",
      "ecs:RegisterTaskDefinition"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "iam" {
  count = terraform.workspace == "dev" || terraform.workspace == "stage" ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "iam:GetRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
  }
}

data "aws_iam_policy_document" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "es:ESHttpDelete",
      "es:ESHttpGet",
      "es:ESHttpHead",
      "es:ESHttpPatch",
      "es:ESHttpPost",
      "es:ESHttpPut"
    ]
    resources = var.opensearch_domain_arns
  }
}

data "aws_iam_policy_document" "s3" {
  count = var.enable_s3_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
      "s3:ListBucketVersions",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = var.s3_bucket_arns
  }
}

data "aws_iam_policy_document" "secrets" {
  count = var.enable_secrets_manager_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:CreateSecret",
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetRandomPassword",
      "secretsmanager:GetSecretValue",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:ListSecrets",
      "secretsmanager:PutSecretValue",
      "secretsmanager:RestoreSecret"
    ]
    resources = var.secrets_manager_secret_arns
  }
}
