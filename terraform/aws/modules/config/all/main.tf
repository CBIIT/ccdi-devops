resource "aws_config_config_rule" "access_keys_rotated" { 
    name = "access-keys-rotated" source { owner = "AWS" source_identifier = "ACCESS_KEYS_ROTATED" } }
resource "aws_config_config_rule" "account_part_of_organizations" { 
    name = "account-part-of-organizations" source { owner = "AWS" source_identifier = "ACCOUNT_PART_OF_ORGANIZATIONS" } }
resource "aws_config_config_rule" "acm_certificate_expiration_check" { 
    name = "acm-certificate-expiration-check" source { owner = "AWS" source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK" } }
resource "aws_config_config_rule" "backup_plan_min_frequency_and_min_retention_check" { name = "backup-plan-min-frequency-and-min-retention-check" source { owner = "AWS" source_identifier = "BACKUP_PLAN_MIN_FREQUENCY_AND_MIN_RETENTION_CHECK" } }
resource "aws_config_config_rule" "backup_recovery_point_encrypted" { name = "backup-recovery-point-encrypted" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_ENCRYPTED" } }
resource "aws_config_config_rule" "backup_recovery_point_manual_deletion_disabled" { name = "backup-recovery-point-manual-deletion-disabled" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_MANUAL_DELETION_DISABLED" } }
resource "aws_config_config_rule" "backup_recovery_point_minimum_retention_check" { name = "backup-recovery-point-minimum-retention-check" source { owner = "AWS" source_identifier = "BACKUP_RECOVERY_POINT_MINIMUM_RETENTION_CHECK" } }
resource "aws_config_config_rule" "clb_desync_mode_check" { name = "clb-desync-mode-check" source { owner = "AWS" source_identifier = "CLB_DESYNC_MODE_CHECK" } }
resource "aws_config_config_rule" "clb_multiple_az" { name = "clb-multiple-az" source { owner = "AWS" source_identifier = "CLB_MULTIPLE_AZ" } }
resource "aws_config_config_rule" "cloudfront_accesslogs_enabled" { name = "cloudfront-accesslogs-enabled" source { owner = "AWS" source_identifier = "CLOUDFRONT_ACCESSLOGS_ENABLED" } }
resource "aws_config_config_rule" "cloudfront_associated_with_waf" { name = "cloudfront-associated-with-waf" source { owner = "AWS" source_identifier = "CLOUDFRONT_ASSOCIATED_WITH_WAF" } }
resource "aws_config_config_rule" "cloudfront_custom_ssl_certificate" { name = "cloudfront-custom-ssl-certificate" source { owner = "AWS" source_identifier = "CLOUDFRONT_CUSTOM_SSL_CERTIFICATE" } }
resource "aws_config_config_rule" "cloudfront_default_root_object_configured" { name = "cloudfront-default-root-object-configured" source { owner = "AWS" source_identifier = "CLOUDFRONT_DEFAULT_ROOT_OBJECT_CONFIGURED" } }
resource "aws_config_config_rule" "cloudfront_no_deprecated_ssl_protocols" { name = "cloudfront-no-deprecated-ssl-protocols" source { owner = "AWS" source_identifier = "CLOUDFRONT_NO_DEPRECATED_SSL_PROTOCOLS" } }
resource "aws_config_config_rule" "cloudfront_origin_access_identity_enabled" { name = "cloudfront-origin-access-identity-enabled" source { owner = "AWS" source_identifier = "CLOUDFRONT_ORIGIN_ACCESS_IDENTITY_ENABLED" } }
resource "aws_config_config_rule" "cloudfront_origin_failover_enabled" { name = "cloudfront-origin-failover-enabled" source { owner = "AWS" source_identifier = "CLOUDFRONT_ORIGIN_FAILOVER_ENABLED" } }
resource "aws_config_config_rule" "cloudfront_security_policy_check" { name = "cloudfront-security-policy-check" source { owner = "AWS" source_identifier = "CLOUDFRONT_SECURITY_POLICY_CHECK" } }
resource "aws_config_config_rule" "cloudfront_sni_enabled" { name = "cloudfront-sni-enabled" source { owner = "AWS" source_identifier = "CLOUDFRONT_SNI_ENABLED" } }
resource "aws_config_config_rule" "cloudfront_traffic_to_origin_encrypted" { name = "cloudfront-traffic-to-origin-encrypted" source { owner = "AWS" source_identifier = "CLOUDFRONT_TRAFFIC_TO_ORIGIN_ENCRYPTED" } }
resource "aws_config_config_rule" "cloudfront_viewer_policy_https" { name = "cloudfront-viewer-policy-https" source { owner = "AWS" source_identifier = "CLOUDFRONT_VIEWER_POLICY_HTTPS" } }
resource "aws_config_config_rule" "cmk_backing_key_rotation_enabled" { name = "cmk-backing-key-rotation-enabled" source { owner = "AWS" source_identifier = "CMK_BACKING_KEY_ROTATION_ENABLED" } }
resource "aws_config_config_rule" "cw_loggroup_retention_period_check" { name = "cw-loggroup-retention-period-check" source { owner = "AWS" source_identifier = "CW_LOGGROUP_RETENTION_PERIOD_CHECK" } }
resource "aws_config_config_rule" "db_instance_backup_enabled" { name = "db-instance-backup-enabled" source { owner = "AWS" source_identifier = "DB_INSTANCE_BACKUP_ENABLED" } }
resource "aws_config_config_rule" "desired_instance_tenancy" { name = "desired-instance-tenancy" source { owner = "AWS" source_identifier = "DESIRED_INSTANCE_TENANCY" } }
resource "aws_config_config_rule" "desired_instance_type" { name = "desired-instance-type" source { owner = "AWS" source_identifier = "DESIRED_INSTANCE_TYPE" } }
resource "aws_config_config_rule" "dms_replication_not_public" { name = "dms-replication-not-public" source { owner = "AWS" source_identifier = "DMS_REPLICATION_NOT_PUBLIC" } }
resource "aws_config_config_rule" "ecr_private_image_scanning_enabled" { name = "ecr-private-image-scanning-enabled" source { owner = "AWS" source_identifier = "ECR_PRIVATE_IMAGE_SCANNING_ENABLED" } }
resource "aws_config_config_rule" "ecr_private_lifecycle_policy_configured" { name = "ecr-private-lifecycle-policy-configured" source { owner = "AWS" source_identifier = "ECR_PRIVATE_LIFECYCLE_POLICY_CONFIGURED" } }
resource "aws_config_config_rule" "ecr_private_tag_immutability_enabled" { name = "ecr-private-tag-immutability-enabled" source { owner = "AWS" source_identifier = "ECR_PRIVATE_TAG_IMMUTABILITY_ENABLED" } }
resource "aws_config_config_rule" "eip_attached" { name = "eip-attached" source { owner = "AWS" source_identifier = "EIP_ATTACHED" } }
resource "aws_config_config_rule" "elasticsearch_encrypted_at_rest" { name = "elasticsearch-encrypted-at-rest" source { owner = "AWS" source_identifier = "ELASTICSEARCH_ENCRYPTED_AT_REST" } }
resource "aws_config_config_rule" "elasticsearch_in_vpc_only" { name = "elasticsearch-in-vpc-only" source { owner = "AWS" source_identifier = "ELASTICSEARCH_IN_VPC_ONLY" } }
resource "aws_config_config_rule" "elasticsearch_logs_to_cloudwatch" { name = "elasticsearch-logs-to-cloudwatch" source { owner = "AWS" source_identifier = "ELASTICSEARCH_LOGS_TO_CLOUDWATCH" } }
resource "aws_config_config_rule" "elasticsearch_node_to_node_encryption_check" { name = "elasticsearch-node-to-node-encryption-check" source { owner = "AWS" source_identifier = "ELASTICSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK" } }
resource "aws_config_config_rule" "elastic_beanstalk_logs_to_cloudwatch" { name = "elastic-beanstalk-logs-to-cloudwatch" source { owner = "AWS" source_identifier = "ELASTIC_BEANSTALK_LOGS_TO_CLOUDWATCH" } }
resource "aws_config_config_rule" "elastic_beanstalk_managed_updates_enabled" { name = "elastic-beanstalk-managed-updates-enabled" source { owner = "AWS" source_identifier = "ELASTIC_BEANSTALK_MANAGED_UPDATES_ENABLED" } }
resource "aws_config_config_rule" "emr_kerberos_enabled" { name = "emr-kerberos-enabled" source { owner = "AWS" source_identifier = "EMR_KERBEROS_ENABLED" } }
resource "aws_config_config_rule" "emr_master_no_public_ip" { name = "emr-master-no-public-ip" source { owner = "AWS" source_identifier = "EMR_MASTER_NO_PUBLIC_IP" } }
resource "aws_config_config_rule" "encrypted_volumes" { name = "encrypted-volumes" source { owner = "AWS" source_identifier = "ENCRYPTED_VOLUMES" } }
resource "aws_config_config_rule" "guardduty_enabled_centralized" { name = "guardduty-enabled-centralized" source { owner = "AWS" source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED" } }
resource "aws_config_config_rule" "guardduty_non_archived_findings" { name = "guardduty-non-archived-findings" source { owner = "AWS" source_identifier = "GUARDDUTY_NON_ARCHIVED_FINDINGS" } }
resource "aws_config_config_rule" "restricted_ssh" { name = "restricted-ssh" source { owner = "AWS" source_identifier = "RESTRICTED_SSH" } }
resource "aws_config_config_rule" "ec2_instances_in_vpc" { name = "ec2-instances-in-vpc" source { owner = "AWS" source_identifier = "EC2_INSTANCES_IN_VPC" } }
resource "aws_config_config_rule" "internet_gateway_authorized_vpc_only" { name = "internet-gateway-authorized-vpc-only" source { owner = "AWS" source_identifier = "INTERNET_GATEWAY_AUTHORIZED_VPC_ONLY" } }
resource "aws_config_config_rule" "kinesis_stream_encrypted" { name = "kinesis-stream-encrypted" source { owner = "AWS" source_identifier = "KINESIS_STREAM_ENCRYPTED" } }
resource "aws_config_config_rule" "kms_cmk_not_scheduled_for_deletion" { name = "kms-cmk-not-scheduled-for-deletion" source { owner = "AWS" source_identifier = "KMS_CMK_NOT_SCHEDULED_FOR_DELETION" } }
resource "aws_config_config_rule" "lambda_concurrency_check" { name = "lambda-concurrency-check" source { owner = "AWS" source_identifier = "LAMBDA_CONCURRENCY_CHECK" } }
resource "aws_config_config_rule" "lambda_dlq_check" { name = "lambda-dlq-check" source { owner = "AWS" source_identifier = "LAMBDA_DLQ_CHECK" } }
resource "aws_config_config_rule" "lambda_function_public_access_prohibited" { name = "lambda-function-public-access-prohibited" source { owner = "AWS" source_identifier = "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED" } }
resource "aws_config_config_rule" "lambda_function_settings_check" { name = "lambda-function-settings-check" source { owner = "AWS" source_identifier = "LAMBDA_FUNCTION_SETTINGS_CHECK" } }
resource "aws_config_config_rule" "lambda_inside_vpc" { name = "lambda-inside-vpc" source { owner = "AWS" source_identifier = "LAMBDA_INSIDE_VPC" } }
resource "aws_config_config_rule" "lambda_vpc_multi_az_check" { name = "lambda-vpc-multi-az-check" source { owner = "AWS" source_identifier = "LAMBDA_VPC_MULTI_AZ_CHECK" } }
resource "aws_config_config_rule" "mfa_enabled_for_iam_console_access" { name = "mfa-enabled-for-iam-console-access" source { owner = "AWS" source_identifier = "MFA_ENABLED_FOR_IAM_CONSOLE_ACCESS" } }
resource "aws_config_config_rule" "nacl_no_unrestricted_ssh_rdp" { name = "nacl-no-unrestricted-ssh-rdp" source { owner = "AWS" source_identifier = "NACL_NO_UNRESTRICTED_SSH_RDP" } }
resource "aws_config_config_rule" "no_unrestricted_route_to_igw" { name = "no-unrestricted-route-to-igw" source { owner = "AWS" source_identifier = "NO_UNRESTRICTED_ROUTE_TO_IGW" } }
resource "aws_config_config_rule" "required_tags" { name = "required-tags" source { owner = "AWS" source_identifier = "REQUIRED_TAGS" } }
resource "aws_config_config_rule" "restricted_common_ports" { name = "restricted-common-ports" source { owner = "AWS" source_identifier = "RESTRICTED_COMMON_PORTS" } }
resource "aws_config_config_rule" "root_account_hardware_mfa_enabled" { name = "root-account-hardware-mfa-enabled" source { owner = "AWS" source_identifier = "ROOT_ACCOUNT_HARDWARE_MFA_ENABLED" } }
resource "aws_config_config_rule" "root_account_mfa_enabled" { name = "root-account-mfa-enabled" source { owner = "AWS" source_identifier = "ROOT_ACCOUNT_MFA_ENABLED" } }
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