
from aws_cdk import core
from aws_cdk import aws_opensearchservice as opensearch
from aws_cdk import aws_cloudwatch as cloudwatch
from aws_cdk import aws_iam as iam

class OpenSearchStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        app: str,
        engine_version: str,
        hot_node_count: int,
        hot_node_type: str,
        master_node_count: int,
        master_node_enabled: bool,
        master_node_type: str,
        multi_az: bool,
        opensearch_security_group_id: set,
        program: str,
        subnet_ids: set,
        tier: str,
        availability_zone_count: int = 2,
        cold_storage_enabled: bool = False,
        ebs_enabled: bool = True,
        ebs_volume_size: int = 30,
        ebs_volume_type: str = "gp3",
        enable_os_application_logs: bool = True,
        enable_os_index_slow_logs: bool = True,
        enable_os_search_slow_logs: bool = True,
        enforce_https: bool = True,
        log_retention: int = 90,
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # CloudWatch log groups
        log_group_app = cloudwatch.LogGroup(
            self,
            "AppLogGroup",
            retention=cloudwatch.RetentionDays(log_retention),
            log_group_name=f"{program}-{tier}-{app}-application",
        )
        log_group_index_slow = cloudwatch.LogGroup(
            self,
            "IndexSlowLogGroup",
            retention=cloudwatch.RetentionDays(log_retention),
            log_group_name=f"{program}-{tier}-{app}-index-slow",
        )
        log_group_search_slow = cloudwatch.LogGroup(
            self,
            "SearchSlowLogGroup",
            retention=cloudwatch.RetentionDays(log_retention),
            log_group_name=f"{program}-{tier}-{app}-search-slow",
        )

        # OpenSearch domain
        opensearch_domain = opensearch.Domain(
            self,
            "OpenSearchDomain",
            domain_name=f"{program}-{tier}-{app}",
            version=opensearch.EngineVersion.of(engine_version),
            capacity=opensearch.CapacityConfig(
                master_nodes=master_node_count if master_node_enabled else None,
                master_node_instance_type=master_node_type if master_node_enabled else None,
                data_nodes=hot_node_count,
                data_node_instance_type=hot_node_type,
            ),
            ebs=opensearch.EbsOptions(
                enabled=ebs_enabled,
                volume_size=ebs_volume_size,
                volume_type=opensearch.EbsDeviceVolumeType.GP3,
            ),
            zone_awareness=opensearch.ZoneAwarenessConfig(
                availability_zone_count=availability_zone_count, enabled=multi_az
            ),
            enforce_https=enforce_https,
            logging=opensearch.LoggingOptions(
                app_log_enabled=enable_os_application_logs,
                app_log_group=log_group_app if enable_os_application_logs else None,
                slow_index_log_enabled=enable_os_index_slow_logs,
                slow_index_log_group=log_group_index_slow
                if enable_os_index_slow_logs
                else None,
                slow_search_log_enabled=enable_os_search_slow_logs,
                slow_search_log_group=log_group_search_slow
                if enable_os_search_slow_logs
                else None,
            ),
        )

        # Outputs
        core.CfnOutput(self, "OpenSearchDomainArn", value=opensearch_domain.domain_arn)
        core.CfnOutput(self, "OpenSearchDomainName", value=opensearch_domain.domain_name)
        core.CfnOutput(self, "OpenSearchDomainEndpoint", value=opensearch_domain.domain_endpoint)
