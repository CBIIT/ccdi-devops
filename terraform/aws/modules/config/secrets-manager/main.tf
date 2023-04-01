resource "aws_config_config_rule" "secretsmanager_rotation_enabled_check" {
  name = "secretsmanager-rotation-enabled-check"

  source {
    owner             = "AWS"
    source_identifier = "SECRETSMANAGER_ROTATION_ENABLED_CHECK"
  }
}

resource "aws_config_config_rule" "secretsmanager_scheduled_rotation_success_check" {
  name = "secretsmanager-scheduled-rotation-success-check"

  source {
    owner             = "AWS"
    source_identifier = "SECRETSMANAGER_SCHEDULED_ROTATION_SUCCESS_CHECK"
  }
}

resource "aws_config_config_rule" "secretsmanager_secret_periodic_rotation" {
  name = "secretsmanager-secret-periodic-rotation"

  source {
    owner             = "AWS"
    source_identifier = "SECRETSMANAGER_SECRET_PERIODIC_ROTATION"
  }
}

resource "aws_config_config_rule" "secretsmanager_secret_unused" {
  name = "secretsmanager-secret-unused"

  source {
    owner             = "AWS"
    source_identifier = "SECRETSMANAGER_SECRET_UNUSED"
  }
}

resource "aws_config_config_rule" "secretsmanager_using_cmk" {
  name = "secretsmanager-using-cmk"

  source {
    owner             = "AWS"
    source_identifier = "SECRETSMANAGER_USING_CMK"
  }
}

