data "aws_s3_bucket" "this" {
  bucket = var.bucket_id
}


data "aws_iam_policy_document" "this" {
  statement {
    sid    = "DataExchangeObjectPermissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.source_replication_role_arn]
    }

    actions = [
      "s3:GetObjectVersionTagging",
      "s3:ObjectOwnerOverrideToBucketOwner",
      "s3:ReplicateDelete",
      "s3:ReplicateObject",
      "s3:ReplicateTags"
    ]

    resources = ["${data.aws_s3_bucket.this.arn}/*"]
  }

  statement {
    sid    = "DataExchangeBucketPermissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.source_replication_role_arn]
    }

    actions = [
      "s3:GetBucketVersioning",
      "s3:List*",
      "s3:PutBucketVersioning"
    ]

    resources = [data.aws_s3_bucket.this.arn]
  }
}
