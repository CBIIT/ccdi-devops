data "aws_region" "this" {

}

data "aws_iam_policy_document" "trust" {
  count = var.create_iam_role ? 1 : 0

  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "this" {
  count = var.create_iam_role ? 1 : 0

  statement {
    sid    = "CtosAllowNonAdminSageMakerActions"
    effect = "Allow"
    actions = [
      "sagemaker:*",
      "sagemaker-geospatial:*"
    ]
    not_resources = [
      "arn:aws:sagemaker:*:*:domain/*",
      "arn:aws:sagemaker:*:*:user-profile/*",
      "arn:aws:sagemaker:*:*:app/*",
      "arn:aws:sagemaker:*:*:space/*",
      "arn:aws:sagemaker:*:*:flow-definition/*"
    ]
  }

  statement {
    sid    = "CtosAllowAddTagsForApp"
    effect = "Allow"
    actions = [
      "sagemaker:AddTags"
    ]
    resources = [
      "arn:aws:sagemaker:*:*:app/*"
    ]
  }

  statement {
    sid    = "CtosAllowStudioActions"
    effect = "Allow"
    actions = [
      "sagemaker:CreatePresignedDomainUrl",
      "sagemaker:DescribeDomain",
      "sagemaker:ListDomains",
      "sagemaker:DescribeUserProfile",
      "sagemaker:ListUserProfiles",
      "sagemaker:DescribeSpace",
      "sagemaker:ListSpaces",
      "sagemaker:DescribeApp",
      "sagemaker:ListApps"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "CtosAllowAppActionsForUserProfile"
    effect = "Allow"
    actions = [
      "sagemaker:CreateApp",
      "sagemaker:DeleteApp"
    ]
    resources = ["arn:aws:sagemaker:*:*:app/*/*/*/*"]
    condition {
      test     = "Null"
      variable = "sagemaker:OwnerUserProfileArn"
      values   = ["true"]
    }
  }

  statement {
    sid    = "CtosAllowAppActionsForSharedSpaces"
    effect = "Allow"
    actions = [
      "sagemaker:CreateApp",
      "sagemaker:DeleteApp"
    ]
    resources = ["arn:aws:sagemaker:*:*:app/*/*/*/*"]
    condition {
      test     = "StringEquals"
      variable = "sagemaker:SpaceSharingType"
      values   = ["Shared"]
    }
  }

  statement {
    sid    = "CtosAllowMutatingActionsOnSharedSpacesWithoutOwner"
    effect = "Allow"
    actions = [
      "sagemaker:CreateSpace",
      "sagemaker:UpdateSpace",
      "sagemaker:DeleteSpace"
    ]
    resources = ["arn:aws:sagemaker:*:*:space/*/*"]
    condition {
      test     = "Null"
      variable = "sagemaker:OwnerUserProfileArn"
      values   = ["true"]
    }
  }

  statement {
    sid    = "CtosRestrictMutatingActionsOnSpacesToOwnerUserProfile"
    effect = "Allow"
    actions = [
      "sagemaker:CreateSpace",
      "sagemaker:UpdateSpace",
      "sagemaker:DeleteSpace"
    ]
    resources = ["arn:aws:sagemaker:*:*:space/*/*"]
    condition {
      test     = "ArnLike"
      variable = "sagemaker:OwnerUserProfileArn"
      values   = ["arn:aws:sagemaker:*:*:user-profile/*/*"]
    }
    condition {
      test     = "StringEquals"
      variable = "sagemaker:SpaceSharingType"
      values   = ["Private", "Shared"]
    }
  }

  statement {
    sid    = "CtosRestrictMutatingActionsOnPrivateSpaceAppsToOwnerUserProfile"
    effect = "Allow"
    actions = [
      "sagemaker:CreateApp",
      "sagemaker:DeleteApp"
    ]
    resources = ["arn:aws:sagemaker:*:*:app/*/*/*/*"]
    condition {
      test     = "ArnLike"
      variable = "sagemaker:OwnerUserProfileArn"
      values   = ["arn:aws:sagemaker:*:*:user-profile/*/*"]
    }
    condition {
      test     = "StringEquals"
      variable = "sagemaker:SpaceSharingType"
      values   = ["Private"]
    }
  }

  statement {
    sid       = "CtosAllowFlowDefinitionActions"
    effect    = "Allow"
    actions   = ["sagemaker:*"]
    resources = ["arn:aws:sagemaker:*:*:flow-definition/*"]
    condition {
      test     = "StringEqualsIfExists"
      variable = "sagemaker:WorkteamType"
      values   = ["private-crowd", "vendor-crowd"]
    }
  }

  statement {
    sid    = "CtosAllowAWSServiceActions"
    effect = "Allow"
    actions = [
      "application-autoscaling:DeleteScalingPolicy",
      "application-autoscaling:DeleteScheduledAction",
      "application-autoscaling:DeregisterScalableTarget",
      "application-autoscaling:DescribeScalableTargets",
      "application-autoscaling:DescribeScalingActivities",
      "application-autoscaling:DescribeScalingPolicies",
      "application-autoscaling:DescribeScheduledActions",
      "application-autoscaling:PutScalingPolicy",
      "application-autoscaling:PutScheduledAction",
      "application-autoscaling:RegisterScalableTarget",
      "aws-marketplace:ViewSubscriptions",
      "cloudformation:GetTemplateSummary",
      "cloudwatch:DeleteAlarms",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:PutMetricData",
      "codecommit:BatchGetRepositories",
      "codecommit:CreateRepository",
      "codecommit:GetRepository",
      "codecommit:List*",
      "cognito-idp:AdminAddUserToGroup",
      "cognito-idp:AdminCreateUser",
      "cognito-idp:AdminDeleteUser",
      "cognito-idp:AdminDisableUser",
      "cognito-idp:AdminEnableUser",
      "cognito-idp:AdminRemoveUserFromGroup",
      "cognito-idp:CreateGroup",
      "cognito-idp:CreateUserPool",
      "cognito-idp:CreateUserPoolClient",
      "cognito-idp:CreateUserPoolDomain",
      "cognito-idp:DescribeUserPool",
      "cognito-idp:DescribeUserPoolClient",
      "cognito-idp:List*",
      "cognito-idp:UpdateUserPool",
      "cognito-idp:UpdateUserPoolClient",
      "ec2:CreateNetworkInterface",
      "ec2:CreateNetworkInterfacePermission",
      "ec2:CreateVpcEndpoint",
      "ec2:DeleteNetworkInterface",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVPCEndpoints",
      "ec2:DescribeVpcs",
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CreateRepository",
      "ecr:Describe*",
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:StartImageScan",
      "elastic-inference:Connect",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeMountTargets",
      "fsx:DescribeFileSystems",
      "glue:CreateJob",
      "glue:DeleteJob",
      "glue:GetJob*",
      "glue:GetTable*",
      "glue:GetWorkflowRun",
      "glue:ResetJobBookmark",
      "glue:StartJobRun",
      "glue:StartWorkflowRun",
      "glue:UpdateJob",
      "groundtruthlabeling:*",
      "iam:ListRoles",
      "kms:DescribeKey",
      "kms:ListAliases",
      "lambda:ListFunctions",
      "logs:CreateLogDelivery",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DeleteLogDelivery",
      "logs:Describe*",
      "logs:GetLogDelivery",
      "logs:GetLogEvents",
      "logs:ListLogDeliveries",
      "logs:PutLogEvents",
      "logs:PutResourcePolicy",
      "logs:UpdateLogDelivery",
      "secretsmanager:ListSecrets",
      "servicecatalog:Describe*",
      "servicecatalog:List*",
      "servicecatalog:ScanProvisionedProducts",
      "servicecatalog:SearchProducts",
      "servicecatalog:SearchProvisionedProducts",
      "sns:ListTopics",
      "tag:GetResources"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "CtosAllowECRActions"
    effect = "Allow"
    actions = [
      "ecr:SetRepositoryPolicy",
      "ecr:CompleteLayerUpload",
      "ecr:BatchDeleteImage",
      "ecr:UploadLayerPart",
      "ecr:DeleteRepositoryPolicy",
      "ecr:InitiateLayerUpload",
      "ecr:DeleteRepository",
      "ecr:PutImage"
    ]
    resources = ["arn:aws:ecr:*:*:repository/*sagemaker*"]
  }

  statement {
    sid    = "CtosAllowCodeCommitActions"
    effect = "Allow"
    actions = [
      "codecommit:GitPull",
      "codecommit:GitPush"
    ]
    resources = [
      "arn:aws:codecommit:*:*:*sagemaker*",
      "arn:aws:codecommit:*:*:*SageMaker*",
      "arn:aws:codecommit:*:*:*Sagemaker*"
    ]
  }

  statement {
    sid    = "CtosAllowCodeBuildActions"
    effect = "Allow"
    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild"
    ]
    resources = [
      "arn:aws:codebuild:*:*:project/sagemaker*",
      "arn:aws:codebuild:*:*:build/*"
    ]
  }

  statement {
    sid    = "CtosAllowStepFunctionsActions"
    effect = "Allow"
    actions = [
      "states:DescribeExecution",
      "states:GetExecutionHistory",
      "states:StartExecution",
      "states:StopExecution",
      "states:UpdateStateMachine"
    ]
    resources = [
      "arn:aws:states:*:*:statemachine:*sagemaker*",
      "arn:aws:states:*:*:execution:*sagemaker*:*"
    ]
  }

  statement {
    sid    = "CtosAllowSecretManagerActions"
    effect = "Allow"
    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue",
      "secretsmanager:CreateSecret"
    ]
    resources = ["arn:aws:secretsmanager:*:*:secret:AmazonSageMaker-*"]
  }

  statement {
    sid    = "CtosAllowReadOnlySecretManagerActions"
    effect = "Allow"
    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "secretsmanager:ResourceTag/SageMaker"
      values   = ["true"]
    }
  }

  statement {
    sid       = "CtosAllowServiceCatalogProvisionProduct"
    effect    = "Allow"
    actions   = ["servicecatalog:ProvisionProduct"]
    resources = ["*"]
  }

  statement {
    sid    = "CtosAllowServiceCatalogTerminateUpdateProvisionProduct"
    effect = "Allow"
    actions = [
      "servicecatalog:TerminateProvisionedProduct",
      "servicecatalog:UpdateProvisionedProduct"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "servicecatalog:userLevel"
      values   = ["self"]
    }
  }

  statement {
    sid    = "CtosAllowS3ObjectActions"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:AbortMultipartUpload"
    ]
    resources = [
      "arn:aws:s3:::*SageMaker*",
      "arn:aws:s3:::*Sagemaker*",
      "arn:aws:s3:::*sagemaker*",
      "arn:aws:s3:::*aws-glue*"
    ]
  }

  statement {
    sid       = "CtosAllowS3GetObjectWithSageMakerExistingObjectTag"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::*"]
    condition {
      test     = "StringEqualsIgnoreCase"
      variable = "s3:ExistingObjectTag/SageMaker"
      values   = ["true"]
    }
  }

  statement {
    sid       = "CtosAllowS3GetObjectWithServiceCatalogProvisioningExistingObjectTag"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::*"]
    condition {
      test     = "StringEquals"
      variable = "s3:ExistingObjectTag/servicecatalog:provisioning"
      values   = ["true"]
    }
  }

  statement {
    sid    = "CtosAllowS3BucketActions"
    effect = "Allow"
    actions = [
      "s3:CreateBucket",
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
      "s3:GetBucketCors",
      "s3:PutBucketCors"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "CtosAllowS3BucketACL"
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::*SageMaker*",
      "arn:aws:s3:::*Sagemaker*",
      "arn:aws:s3:::*sagemaker*"
    ]
  }

  statement {
    sid     = "CtosAllowLambdaInvokeFunction"
    effect  = "Allow"
    actions = ["lambda:InvokeFunction"]
    resources = [
      "arn:aws:lambda:*:*:function:*SageMaker*",
      "arn:aws:lambda:*:*:function:*sagemaker*",
      "arn:aws:lambda:*:*:function:*Sagemaker*",
      "arn:aws:lambda:*:*:function:*LabelingFunction*"
    ]
  }

  statement {
    sid       = "CtosAllowCreateServiceLinkedRoleForSageMakerApplicationAutoscaling"
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["arn:aws:iam::*:role/aws-service-role/sagemaker.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_SageMakerEndpoint"]
    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["sagemaker.application-autoscaling.amazonaws.com"]
    }
  }

  statement {
    sid       = "CtosAllowCreateServiceLinkedRoleForRobomaker"
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values   = ["robomaker.amazonaws.com"]
    }
  }

  statement {
    sid    = "CtosAllowSNSActions"
    effect = "Allow"
    actions = [
      "sns:Subscribe",
      "sns:CreateTopic",
      "sns:Publish"
    ]
    resources = [
      "arn:aws:sns:*:*:*SageMaker*",
      "arn:aws:sns:*:*:*Sagemaker*",
      "arn:aws:sns:*:*:*sagemaker*"
    ]
  }

  statement {
    sid       = "CtosAllowPassRoleForSageMakerRoles"
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::*:role/*AmazonSageMaker*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["glue.amazonaws.com", "robomaker.amazonaws.com", "states.amazonaws.com"]
    }
  }

  statement {
    sid       = "CtosAllowPassRoleToSageMaker"
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = "arn:aws:iam::*:role/*"
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["sagemaker.amazonaws.com"]
    }
  }

  statement {
    sid    = "CtosAllowAthenaActions"
    effect = "Allow"
    actions = [
      "athena:ListDataCatalogs",
      "athena:ListDatabases",
      "athena:ListTableMetadata",
      "athena:GetQueryExecution",
      "athena:GetQueryResults",
      "athena:StartQueryExecution",
      "athena:StopQueryExecution"
    ]
    resources = ["*"]
  }

  statement {
    sid     = "CtosAllowGlueCreateTable"
    effect  = "Allow"
    actions = ["glue:CreateTable"]
    resources = [
      "arn:aws:glue:*:*:table/*/sagemaker_tmp_*",
      "arn:aws:glue:*:*:table/sagemaker_featurestore/*",
      "arn:aws:glue:*:*:catalog",
      "arn:aws:glue:*:*:database/*"
    ]
  }

  statement {
    sid     = "CtosAllowGlueUpdateTable"
    effect  = "Allow"
    actions = ["glue:UpdateTable"]
    resources = [
      "arn:aws:glue:*:*:table/sagemaker_featurestore/*",
      "arn:aws:glue:*:*:catalog",
      "arn:aws:glue:*:*:database/sagemaker_featurestore"
    ]
  }

  statement {
    sid     = "CtosAllowGlueDeleteTable"
    effect  = "Allow"
    actions = ["glue:DeleteTable"]
    resources = [
      "arn:aws:glue:*:*:table/*/sagemaker_tmp_*",
      "arn:aws:glue:*:*:catalog",
      "arn:aws:glue:*:*:database/*"
    ]
  }

  statement {
    sid    = "CtosAllowGlueGetTablesAndDatabases"
    effect = "Allow"
    actions = [
      "glue:GetTable",
      "glue:GetTables",
      "glue:GetDatabases"
    ]
    resources = [
      "arn:aws:glue:*:*:table/*",
      "arn:aws:glue:*:*:catalog",
      "arn:aws:glue:*:*:database/*"
    ]
  }

  statement {
    sid    = "CtosAllowGlueGetAndCreateDatabase"
    effect = "Allow"
    actions = [
      "glue:GetDatabase",
      "glue:CreateDatabase"
    ]
    resources = [
      "arn:aws:glue:*:*:catalog",
      "arn:aws:glue:*:*:database/sagemaker_featurestore",
      "arn:aws:glue:*:*:database/sagemaker_processing",
      "arn:aws:glue:*:*:database/default",
      "arn:aws:glue:*:*:database/sagemaker_data_wrangler"
    ]
  }

  statement {
    sid       = "CtosAllowListTagsForResource"
    effect    = "Allow"
    actions   = ["sagemaker:ListTags"]
    resources = ["arn:aws:sagemaker:*:*:user-profile/*"]
  }

  statement {
    sid     = "CtosAllowS3ExpressObjectActions"
    effect  = "Allow"
    actions = ["s3express:CreateSession", "s3express:CreateBucket"]
    resources = [
      "arn:aws:s3express:*:*:bucket/*SageMaker*",
      "arn:aws:s3express:*:*:bucket/*Sagemaker*",
      "arn:aws:s3express:*:*:bucket/*sagemaker*",
      "arn:aws:s3express:*:*:bucket/*aws-glue*"
    ]
  }

  statement {
    sid       = "CtosAllowS3ExpressListDirectoryActions"
    effect    = "Allow"
    actions   = ["s3express:ListAllMyDirectoryBuckets"]
    resources = ["*"]
  }
}
