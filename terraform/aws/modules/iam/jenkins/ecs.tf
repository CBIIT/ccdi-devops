resource "aws_iam_policy" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecs"
  description = "allow jenkins to access specified ecs clusters to perform deployment operations"
  policy      = data.aws_iam_policy_document.ecs[0].json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs[0].arn
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
