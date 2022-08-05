data "aws_caller_identity" "current" {
  
}

data "aws_iam_policy_document" "ecr" {

  statement {
    sid    = "ElasticContainerRegistryPushAndPull"
    effect = "Allow"

    principals {
      identifiers = ["${data.aws_caller_identity.current.account_id}"]
      type        = "AWS"
    }
    actions = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
  }
}