
from aws_cdk import core
from aws_cdk import aws_kinesisfirehose as firehose
from aws_cdk import aws_iam as iam
from aws_cdk import aws_s3 as s3

class KinesisFirehoseStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        account_id: str,
        app: str,
        external_id: str,
        http_endpoint_access_key: str,
        level: str,
        program: str,
        s3_bucket_arn: str,
        buffer_interval: int = 60,
        buffer_size: int = 1,
        content_encoding: str = "GZIP",
        destination: str = "http_endpoint",
        http_endpoint_name: str = "New Relic",
        http_endpoint_url: str = "https://gov-metric-api.newrelic.com/metric/v1",
        s3_backup_mode: str = "FailedDataOnly",
        s3_compression_format: str = "UNCOMPRESSED",
        s3_error_output_prefix: str = None,
        s3_object_prefix: str = None,
        iam_prefix: str = "power-user",
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # S3 Bucket reference for failed delivery
        s3_bucket = s3.Bucket.from_bucket_arn(self, "S3Bucket", s3_bucket_arn)

        # IAM Role for Kinesis Firehose
        firehose_role = iam.Role(
            self,
            "FirehoseRole",
            assumed_by=iam.ServicePrincipal("firehose.amazonaws.com"),
            inline_policies={
                "FirehosePolicy": iam.PolicyDocument(
                    statements=[
                        iam.PolicyStatement(
                            actions=[
                                "s3:PutObject",
                                "s3:PutObjectAcl",
                                "s3:GetBucketLocation",
                                "s3:GetObject",
                                "s3:ListBucket",
                            ],
                            resources=[
                                f"{s3_bucket.bucket_arn}/*",
                                s3_bucket.bucket_arn,
                            ],
                        ),
                        iam.PolicyStatement(
                            actions=["logs:PutLogEvents"],
                            resources=["*"],
                        ),
                    ]
                )
            },
        )

        # Kinesis Firehose Delivery Stream
        firehose_stream = firehose.CfnDeliveryStream(
            self,
            "KinesisFirehoseStream",
            delivery_stream_name=f"{program}-{level}-{app}-firehose",
            delivery_stream_type="DirectPut",
            http_endpoint_destination_configuration=firehose.CfnDeliveryStream.HttpEndpointDestinationConfigurationProperty(
                endpoint_configuration=firehose.CfnDeliveryStream.HttpEndpointConfigurationProperty(
                    url=http_endpoint_url, name=http_endpoint_name, access_key=http_endpoint_access_key
                ),
                buffering_hints=firehose.CfnDeliveryStream.BufferingHintsProperty(
                    interval_in_seconds=buffer_interval, size_in_m_bs=buffer_size
                ),
                cloud_watch_logging_options=firehose.CfnDeliveryStream.CloudWatchLoggingOptionsProperty(
                    enabled=True,
                    log_group_name=f"/aws/kinesisfirehose/{program}/{app}",
                    log_stream_name=f"{level}",
                ),
                s3_backup_mode=s3_backup_mode,
                s3_configuration=firehose.CfnDeliveryStream.S3DestinationConfigurationProperty(
                    bucket_arn=s3_bucket_arn,
                    role_arn=firehose_role.role_arn,
                    compression_format=s3_compression_format,
                    error_output_prefix=s3_error_output_prefix,
                    prefix=s3_object_prefix,
                ),
                content_encoding=content_encoding,
            ),
        )

        # Outputs
        core.CfnOutput(self, "FirehoseDeliveryStreamArn", value=firehose_stream.attr_arn)
