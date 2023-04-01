resource "aws_config_config_rule" "access_keys_rotated" {
  name        = "access-keys-rotated"
  description = "Checks whether access keys are rotated every 90 days."

  source {
    owner             = "AWS"
    source_identifier = "ACCESS_KEYS_ROTATED"
  }
}

resource "aws_config_config_rule" "iam_customer_policy_blocked_kms_actions" {
  name = "iam-customer-policy-blocked-kms-actions"

  source {
    owner             = "AWS"
    source_identifier = "IAM_CUSTOMER_POLICY_BLOCKED_KMS_ACTIONS"
  }
}

resource "aws_config_config_rule" "iam_group_has_users_check" {
  name = "iam-group-has-users-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_GROUP_HAS_USERS_CHECK"
  }
}

resource "aws_config_config_rule" "iam_inline_policy_blocked_kms_actions" {
  name = "iam-inline-policy-blocked-kms-actions"

  source {
    owner             = "AWS"
    source_identifier = "IAM_INLINE_POLICY_BLOCKED_KMS_ACTIONS"
  }
}

resource "aws_config_config_rule" "iam_no_inline_policy_check" {
  name = "iam-no-inline-policy-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_NO_INLINE_POLICY_CHECK"
  }
}

resource "aws_config_config_rule" "iam_password_policy" {
  name = "iam-password-policy"

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }
}

resource "aws_config_config_rule" "iam_policy_blacklisted_check" {
  name = "iam-policy-blacklisted-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_POLICY_BLACKLISTED_CHECK"
  }
}

resource "aws_config_config_rule" "iam_policy_in_use" {
  name = "iam-policy-in-use"

  source {
    owner             = "AWS"
    source_identifier = "IAM_POLICY_IN_USE"
  }
}

resource "aws_config_config_rule" "iam_policy_no_statements_with_admin_access" {
  name = "iam-policy-no-statements-with-admin-access"

  source {
    owner             = "AWS"
    source_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_ADMIN_ACCESS"
  }
}

resource "aws_config_config_rule" "iam_policy_no_statements_with_full_access" {
  name = "iam-policy-no-statements-with-full-access"

  source {
    owner             = "AWS"
    source_identifier = "IAM_POLICY_NO_STATEMENTS_WITH_FULL_ACCESS"
  }
}

resource "aws_config_config_rule" "iam_role_managed_policy_check" {
  name = "iam-role-managed-policy-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_ROLE_MANAGED_POLICY_CHECK"
  }
}

resource "aws_config_config_rule" "iam_root_access_key_check" {
  name = "iam-root-access-key-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_ROOT_ACCESS_KEY_CHECK"
  }
}

resource "aws_config_config_rule" "iam_user_group_membership_check" {
  name = "iam-user-group-membership-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_GROUP_MEMBERSHIP_CHECK"
  }
}

resource "aws_config_config_rule" "iam_user_mfa_enabled" {
  name = "iam-user-mfa-enabled"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_MFA_ENABLED"
  }
}

resource "aws_config_config_rule" "iam_user_no_policies_check" {
  name = "iam-user-no-policies-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_NO_POLICIES_CHECK"
  }
}

resource "aws_config_config_rule" "iam_user_unused_credentials_check" {
  name = "iam-user-unused-credentials-check"

  source {
    owner             = "AWS"
    source_identifier = "IAM_USER_UNUSED_CREDENTIALS_CHECK"
  }
}
