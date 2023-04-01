resource "aws_config_config_rule" "s3_account_level_public_access_blocks" {
  name = "s3-account-level-public-access-blocks"

  source {
    owner             = "AWS"
    source_identifier = "S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS"
  }
}

resource "aws_config_config_rule" "s3_account_level_public_access_blocks_periodic" {
  name = "s3-account-level-public-access-blocks-periodic"

  source {
    owner             = "AWS"
    source_identifier = "S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS_PERIODIC"
  }
}

resource "aws_config_config_rule" "s3_bucket_acl_prohibited" {
  name = "s3-bucket-acl-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_ACL_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_blacklisted_actions_prohibited" {
  name = "s3-bucket-blacklisted-actions-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_BLACKLISTED_ACTIONS_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_default_lock_enabled" {
  name = "s3-bucket-default-lock-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_DEFAULT_LOCK_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_level_public_access_prohibited" {
  name = "s3-bucket-level-public-access-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_LEVEL_PUBLIC_ACCESS_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_logging_enabled" {
  name = "s3-bucket-logging-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_policy_grantee_check" {
  name = "s3-bucket-policy-grantee-check"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_POLICY_GRANTEE_CHECK"
  }
}

resource "aws_config_config_rule" "s3_bucket_policy_not_more_permissive" {
  name = "s3-bucket-policy-not-more-permissive"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_POLICY_NOT_MORE_PERMISSIVE"
  }
}

resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name = "s3-bucket-public-read-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_public_write_prohibited" {
  name = "s3-bucket-public-write-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
  }
}

resource "aws_config_config_rule" "s3_bucket_replication_enabled" {
  name = "s3-bucket-replication-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_REPLICATION_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_server_side_encryption_enabled" {
  name = "s3-bucket-server-side-encryption-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_bucket_ssl_requests_only" {
  name = "s3-bucket-ssl-requests-only"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }
}

resource "aws_config_config_rule" "s3_bucket_versioning_enabled" {
  name = "s3-bucket-versioning-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_default_encryption_kms" {
  name = "s3-default-encryption-kms"

  source {
    owner             = "AWS"
    source_identifier = "S3_DEFAULT_ENCRYPTION_KMS"
  }
}

resource "aws_config_config_rule" "s3_event_notifications_enabled" {
  name = "s3-event-notifications-enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_EVENT_NOTIFICATIONS_ENABLED"
  }
}

resource "aws_config_config_rule" "s3_last_backup_recovery_point_created" {
  name = "s3-last-backup-recovery-point-created"

  source {
    owner             = "AWS"
    source_identifier = "S3_LAST_BACKUP_RECOVERY_POINT_CREATED"
  }
}

resource "aws_config_config_rule" "s3_lifecycle_policy_check" {
  name = "s3-lifecycle-policy-check"

  source {
    owner             = "AWS"
    source_identifier = "S3_LIFECYCLE_POLICY_CHECK"
  }
}

resource "aws_config_config_rule" "s3_resources_protected_by_backup_plan" {
  name = "s3-resources-protected-by-backup-plan"

  source {
    owner             = "AWS"
    source_identifier = "S3_RESOURCES_PROTECTED_BY_BACKUP_PLAN"
  }
}

resource "aws_config_config_rule" "s3_version_lifecycle_policy_check" {
  name = "s3-version-lifecycle-policy-check"

  source {
    owner             = "AWS"
    source_identifier = "S3_VERSION_LIFECYCLE_POLICY_CHECK"
  }
}

