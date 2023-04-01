resource "aws_config_config_rule" "ecs_awsvpc_networking_enabled" {
  name        = "ecs-awsvpc-networking-enabled"
  description = "Checks that the ECS cluster is configured to use the awsvpc networking mode."

  source {
    owner             = "AWS"
    source_identifier = "ECS_AWSVPC_NETWORKING_ENABLED"
  }
}

resource "aws_config_config_rule" "ecs_containers_nonprivileged" {
  name        = "ecs-containers-nonprivileged"
  description = "Checks that the containers are not running with root privileges."

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINERS_NONPRIVILEGED"
  }
}

resource "aws_config_config_rule" "ecs_containers_readonly_access" {
  name        = "ecs-containers-readonly-access"
  description = "Checks that the containers are not running with root privileges."

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINERS_READONLY_ACCESS"
  }
}

resource "aws_config_config_rule" "ecs_container_insights_enabled" {
  name        = "ecs-container-insights-enabled"
  description = "Checks that the container insights is enabled."

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINER_INSIGHTS_ENABLED"
  }
}

resource "aws_config_config_rule" "ecs_fargate_latest_platform_version" {
  name        = "ecs-fargate-latest-platform-version"
  description = "Checks that the Fargate platform version is the latest."

  source {
    owner             = "AWS"
    source_identifier = "ECS_FARGATE_LATEST_PLATFORM_VERSION"
  }
}

resource "aws_config_config_rule" "ecs_no_environment_secrets" {
  name        = "ecs-no-environment-secrets"
  description = "Checks that the environment variables are not set to secrets."

  source {
    owner             = "AWS"
    source_identifier = "ECS_NO_ENVIRONMENT_SECRETS"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_log_configuration" {
  name = "ecs-task-definition-log-configuration"

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_LOG_CONFIGURATION"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_memory_hard_limit" {
  name        = "ecs-task-definition-memory-hard-limit"
  description = "Checks that the memory hard limit is set for the task definition."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_MEMORY_HARD_LIMIT"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_nonroot_user" {
  name        = "ecs-task-definition-nonroot-user"
  description = "Checks that the user is set to root when using host mode networking."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_NONROOT_USER"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_pid_mode_check" {
  name        = "ecs-task-definition-pid-mode-check"
  description = "Checks that the PID mode is set to host when using host mode networking."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_PID_MODE_CHECK"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_user_for_host_mode_check" {
  name        = "ecs-task-definition-user-for-host-mode-check"
  description = "Checks that the user is set to root when using host mode networking."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_USER_FOR_HOST_MODE_CHECK"
  }
}

