
from aws_cdk import core
from aws_cdk import aws_s3 as s3
from aws_cdk import aws_config as config

class AwsConfigStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        program: str,
        app: str,
        level: str,
        service_log_bucket: str,
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # Reference to S3 Bucket for Config logs
        config_bucket = s3.Bucket.from_bucket_name(self, "ConfigBucket", service_log_bucket)

        # AWS Config Delivery Channel
        delivery_channel = config.CfnDeliveryChannel(
            self,
            "ConfigDeliveryChannel",
            s3_bucket_name=config_bucket.bucket_name,
            s3_key_prefix=f"{program}/{level}/{app}/config",
            name=f"{program}-{app}-{level}-config-delivery-channel",
        )

        # AWS Config Configuration Recorder
        configuration_recorder = config.CfnConfigurationRecorder(
            self,
            "ConfigRecorder",
            role_arn="arn:aws:iam::123456789012:role/service-role/config-role",  # Replace with actual role ARN
            recording_group=config.CfnConfigurationRecorder.RecordingGroupProperty(
                all_supported=True, include_global_resource_types=True
            ),
            name=f"{program}-{app}-{level}-config-recorder",
        )

        # Ensure the configuration recorder depends on the delivery channel
        configuration_recorder.add_dependency(delivery_channel)

        # AWS Config Configuration Recorder Status
        config.CfnConfigurationRecorderStatus(
            self,
            "ConfigRecorderStatus",
            configuration_recorder_name=configuration_recorder.name,
            enabled=True,
        )

        # Outputs
        core.CfnOutput(self, "DeliveryChannelName", value=delivery_channel.name)
        core.CfnOutput(self, "ConfigurationRecorderName", value=configuration_recorder.name)
