resource "aws_config_config_rule" "cloudwatch_alarm_action_check" { name = "cloudwatch-alarm-action-check" source { owner = "AWS" source_identifier = "CLOUDWATCH_ALARM_ACTION_CHECK" } }
resource "aws_config_config_rule" "cloudwatch_alarm_action_enabled_check" { name = "cloudwatch-alarm-action-enabled-check" source { owner = "AWS" source_identifier = "CLOUDWATCH_ALARM_ACTION_ENABLED_CHECK" } }
resource "aws_config_config_rule" "cloudwatch_alarm_resource_check" { name = "cloudwatch-alarm-resource-check" source { owner = "AWS" source_identifier = "CLOUDWATCH_ALARM_RESOURCE_CHECK" } }
resource "aws_config_config_rule" "cloudwatch_alarm_settings_check" { name = "cloudwatch-alarm-settings-check" source { owner = "AWS" source_identifier = "CLOUDWATCH_ALARM_SETTINGS_CHECK" } }
resource "aws_config_config_rule" "cloudwatch_log_group_encrypted" { name = "cloudwatch-log-group-encrypted" source { owner = "AWS" source_identifier = "CLOUDWATCH_LOG_GROUP_ENCRYPTED" } }
