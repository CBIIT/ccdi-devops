resource "aws_config_config_rule" "cloudtrail_s3_dataevents_enabled" { name = "cloudtrail-s3-dataevents-enabled" source { owner = "AWS" source_identifier = "CLOUDTRAIL_S3_DATAEVENTS_ENABLED" } }
resource "aws_config_config_rule" "cloudtrail_security_trail_enabled" { name = "cloudtrail-security-trail-enabled" source { owner = "AWS" source_identifier = "CLOUDTRAIL_SECURITY_TRAIL_ENABLED" } }
resource "aws_config_config_rule" "cloud_trail_cloud_watch_logs_enabled" { name = "cloud-trail-cloud-watch-logs-enabled" source { owner = "AWS" source_identifier = "CLOUD_TRAIL_CLOUD_WATCH_LOGS_ENABLED" } }
resource "aws_config_config_rule" "cloudtrail_enabled" { name = "cloudtrail-enabled" source { owner = "AWS" source_identifier = "CLOUDTRAIL_ENABLED" } }
resource "aws_config_config_rule" "cloud_trail_encryption_enabled" { name = "cloud-trail-encryption-enabled" source { owner = "AWS" source_identifier = "CLOUD_TRAIL_ENCRYPTION_ENABLED" } }
resource "aws_config_config_rule" "cloud_trail_log_file_validation_enabled" { name = "cloud-trail-log-file-validation-enabled" source { owner = "AWS" source_identifier = "CLOUD_TRAIL_LOG_FILE_VALIDATION_ENABLED" } }
