resource "aws_config_config_rule" "access_keys_rotated" { 
    name = "access-keys-rotated" source { owner = "AWS" source_identifier = "ACCESS_KEYS_ROTATED" } }

resource "aws_config_config_rule" "acm_certificate_expiration_check" { 
    name = "acm-certificate-expiration-check" source { owner = "AWS" source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK" } }
resource "aws_config_config_rule" "backup_plan_min_frequency_and_min_retention_check" { name = "backup-plan-min-frequency-and-min-retention-check" source { owner = "AWS" source_identifier = "BACKUP_PLAN_MIN_FREQUENCY_AND_MIN_RETENTION_CHECK" } }
resource "aws_config_config_rule" "backup_recovery_point_encrypted" { name = "backup-recovery-point-encrypted" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_ENCRYPTED" } }
resource "aws_config_config_rule" "backup_recovery_point_manual_deletion_disabled" { name = "backup-recovery-point-manual-deletion-disabled" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_MANUAL_DELETION_DISABLED" } }
resource "aws_config_config_rule" "backup_recovery_point_minimum_retention_check" { name = "backup-recovery-point-minimum-retention-check" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_MINIMUM_RETENTION_CHECK" } }
resource "aws_config_config_rule" "cmk_backing_key_rotation_enabled" { name = "cmk-backing-key-rotation-enabled" source { owner = "AWS" source_identifier = "CMK_BACKING_KEY_ROTATION_ENABLED" } }
resource "aws_config_config_rule" "db_instance_backup_enabled" { name = "db-instance-backup-enabled" source { owner = "AWS" source_identifier = "DB_INSTANCE_BACKUP_ENABLED" } }
resource "aws_config_config_rule" "desired_instance_tenancy" { name = "desired-instance-tenancy" source { owner = "AWS" source_identifier = "DESIRED_INSTANCE_TENANCY" } }
resource "aws_config_config_rule" "desired_instance_type" { name = "desired-instance-type" source { owner = "AWS" source_identifier = "DESIRED_INSTANCE_TYPE" } }
resource "aws_config_config_rule" "dms_replication_not_public" { name = "dms-replication-not-public" source { owner = "AWS" source_identifier = "DMS_REPLICATION_NOT_PUBLIC" } }
resource "aws_config_config_rule" "eip_attached" { name = "eip-attached" source { owner = "AWS" source_identifier = "EIP_ATTACHED" } }
resource "aws_config_config_rule" "elasticsearch_encrypted_at_rest" { name = "elasticsearch-encrypted-at-rest" source { owner = "AWS" source_identifier = "ELASTICSEARCH_ENCRYPTED_AT_REST" } }
resource "aws_config_config_rule" "elasticsearch_in_vpc_only" { name = "elasticsearch-in-vpc-only" source { owner = "AWS" source_identifier = "ELASTICSEARCH_IN_VPC_ONLY" } }
resource "aws_config_config_rule" "elasticsearch_logs_to_cloudwatch" { name = "elasticsearch-logs-to-cloudwatch" source { owner = "AWS" source_identifier = "ELASTICSEARCH_LOGS_TO_CLOUDWATCH" } }
resource "aws_config_config_rule" "elasticsearch_node_to_node_encryption_check" { name = "elasticsearch-node-to-node-encryption-check" source { owner = "AWS" source_identifier = "ELASTICSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK" } }
resource "aws_config_config_rule" "encrypted_volumes" { name = "encrypted-volumes" source { owner = "AWS" source_identifier = "ENCRYPTED_VOLUMES" } }
resource "aws_config_config_rule" "guardduty_enabled_centralized" { name = "guardduty-enabled-centralized" source { owner = "AWS" source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED" } }
resource "aws_config_config_rule" "guardduty_non_archived_findings" { name = "guardduty-non-archived-findings" source { owner = "AWS" source_identifier = "GUARDDUTY_NON_ARCHIVED_FINDINGS" } }
resource "aws_config_config_rule" "restricted_ssh" { name = "restricted-ssh" source { owner = "AWS" source_identifier = "RESTRICTED_SSH" } }
resource "aws_config_config_rule" "internet_gateway_authorized_vpc_only" { name = "internet-gateway-authorized-vpc-only" source { owner = "AWS" source_identifier = "INTERNET_GATEWAY_AUTHORIZED_VPC_ONLY" } }
resource "aws_config_config_rule" "kinesis_stream_encrypted" { name = "kinesis-stream-encrypted" source { owner = "AWS" source_identifier = "KINESIS_STREAM_ENCRYPTED" } }
resource "aws_config_config_rule" "kms_cmk_not_scheduled_for_deletion" { name = "kms-cmk-not-scheduled-for-deletion" source { owner = "AWS" source_identifier = "KMS_CMK_NOT_SCHEDULED_FOR_DELETION" } }
resource "aws_config_config_rule" "lambda_concurrency_check" { name = "lambda-concurrency-check" source { owner = "AWS" source_identifier = "LAMBDA_CONCURRENCY_CHECK" } }
resource "aws_config_config_rule" "lambda_dlq_check" { name = "lambda-dlq-check" source { owner = "AWS" source_identifier = "LAMBDA_DLQ_CHECK" } }
resource "aws_config_config_rule" "lambda_function_public_access_prohibited" { name = "lambda-function-public-access-prohibited" source { owner = "AWS" source_identifier = "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED" } }
resource "aws_config_config_rule" "lambda_function_settings_check" { name = "lambda-function-settings-check" source { owner = "AWS" source_identifier = "LAMBDA_FUNCTION_SETTINGS_CHECK" } }
resource "aws_config_config_rule" "lambda_inside_vpc" { name = "lambda-inside-vpc" source { owner = "AWS" source_identifier = "LAMBDA_INSIDE_VPC" } }
resource "aws_config_config_rule" "lambda_vpc_multi_az_check" { name = "lambda-vpc-multi-az-check" source { owner = "AWS" source_identifier = "LAMBDA_VPC_MULTI_AZ_CHECK" } }
resource "aws_config_config_rule" "required_tags" { name = "required-tags" source { owner = "AWS" source_identifier = "REQUIRED_TAGS" } }
resource "aws_config_config_rule" "restricted_common_ports" { name = "restricted-common-ports" source { owner = "AWS" source_identifier = "RESTRICTED_COMMON_PORTS" } }
resource "aws_config_config_rule" "securityhub_enabled" { name = "securityhub-enabled" source { owner = "AWS" source_identifier = "SECURITYHUB_ENABLED" } }
resource "aws_config_config_rule" "security_account_information_provided" { name = "security-account-information-provided" source { owner = "AWS" source_identifier = "SECURITY_ACCOUNT_INFORMATION_PROVIDED" } }
resource "aws_config_config_rule" "service_vpc_endpoint_enabled" { name = "service-vpc-endpoint-enabled" source { owner = "AWS" source_identifier = "SERVICE_VPC_ENDPOINT_ENABLED" } }
resource "aws_config_config_rule" "shield_advanced_enabled_autorenew" { name = "shield-advanced-enabled-autorenew" source { owner = "AWS" source_identifier = "SHIELD_ADVANCED_ENABLED_AUTORENEW" } }
resource "aws_config_config_rule" "shield_drt_access" { name = "shield-drt-access" source { owner = "AWS" source_identifier = "SHIELD_DRT_ACCESS" } }
resource "aws_config_config_rule" "sns_encrypted_kms" { name = "sns-encrypted-kms" source { owner = "AWS" source_identifier = "SNS_ENCRYPTED_KMS" } }
resource "aws_config_config_rule" "sns_topic_message_delivery_notification_enabled" { name = "sns-topic-message-delivery-notification-enabled" source { owner = "AWS" source_identifier = "SNS_TOPIC_MESSAGE_DELIVERY_NOTIFICATION_ENABLED" } }
resource "aws_config_config_rule" "ssm_document_not_public" { name = "ssm-document-not-public" source { owner = "AWS" source_identifier = "SSM_DOCUMENT_NOT_PUBLIC" } }
resource "aws_config_config_rule" "subnet_auto_assign_public_ip_disabled" { name = "subnet-auto-assign-public-ip-disabled" source { owner = "AWS" source_identifier = "SUBNET_AUTO_ASSIGN_PUBLIC_IP_DISABLED" } }
resource "aws_config_config_rule" "virtualmachine_last_backup_recovery_point_created" { name = "virtualmachine-last-backup-recovery-point-created" source { owner = "AWS" source_identifier = "VIRTUALMACHINE_LAST_BACKUP_RECOVERY_POINT_CREATED" } }
resource "aws_config_config_rule" "virtualmachine_resources_protected_by_backup_plan" { name = "virtualmachine-resources-protected-by-backup-plan" source { owner = "AWS" source_identifier = "VIRTUALMACHINE_RESOURCES_PROTECTED_BY_BACKUP_PLAN" } }
resource "aws_config_config_rule" "vpc_default_security_group_closed" { name = "vpc-default-security-group-closed" source { owner = "AWS" source_identifier = "VPC_DEFAULT_SECURITY_GROUP_CLOSED" } }
resource "aws_config_config_rule" "vpc_flow_logs_enabled" { name = "vpc-flow-logs-enabled" source { owner = "AWS" source_identifier = "VPC_FLOW_LOGS_ENABLED" } }
resource "aws_config_config_rule" "vpc_network_acl_unused_check" { name = "vpc-network-acl-unused-check" source { owner = "AWS" source_identifier = "VPC_NETWORK_ACL_UNUSED_CHECK" } }
resource "aws_config_config_rule" "vpc_peering_dns_resolution_check" { name = "vpc-peering-dns-resolution-check" source { owner = "AWS" source_identifier = "VPC_PEERING_DNS_RESOLUTION_CHECK" } }
resource "aws_config_config_rule" "vpc_sg_open_only_to_authorized_ports" { 
    name = "vpc-sg-open-only-to-authorized-ports" source { owner = "AWS" source_identifier = "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS" } }
resource "aws_config_config_rule" "vpc_vpn_2_tunnels_up" { 
    name = "vpc-vpn-2-tunnels-up" source { owner = "AWS" source_identifier = "VPC_VPN_2_TUNNELS_UP" } }
resource "aws_config_config_rule" "wafv2_logging_enabled" { 
    name = "wafv2-logging-enabled" source { owner = "AWS" source_identifier = "WAFV2_LOGGING_ENABLED" } }
resource "aws_config_config_rule" "wafv2_rulegroup_not_empty" { 
    name = "wafv2-rulegroup-not-empty" source { owner = "AWS" source_identifier = "WAFV2_RULEGROUP_NOT_EMPTY" } }
resource "aws_config_config_rule" "wafv2_webacl_not_empty" { 
    name = "wafv2-webacl-not-empty" source { owner = "AWS" source_identifier = "WAFV2_WEBACL_NOT_EMPTY" } }