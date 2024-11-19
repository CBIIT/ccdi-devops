
from aws_cdk import core
from aws_cdk import aws_cloudwatch as cloudwatch
from aws_cdk import aws_iam as iam

class CloudWatchMetricStreamStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        account_id: str,
        app: str,
        firehose_delivery_stream_arn: str,
        level: str,
        program: str,
        iam_prefix: str = "power-user",
        include_filter: list = ["AWS/ES", "AWS/ApplicationELB"],
        output_format: str = "opentelemetry0.7",
        role_force_detach_policies: bool = False,
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # IAM Role for Metric Stream
        metric_stream_role = iam.Role(
            self,
            "MetricStreamRole",
            assumed_by=iam.ServicePrincipal("cloudwatch.amazonaws.com"),
            role_name=f"{iam_prefix}-{program}-{level}-{app}-metric-stream-role",
            inline_policies={
                "MetricStreamPolicy": iam.PolicyDocument(
                    statements=[
                        iam.PolicyStatement(
                            actions=["firehose:PutRecord", "firehose:PutRecordBatch"],
                            resources=[firehose_delivery_stream_arn],
                        ),
                        iam.PolicyStatement(
                            actions=["logs:PutLogEvents"],
                            resources=["*"],
                        ),
                    ]
                )
            },
            force_detach_policies=role_force_detach_policies,
        )

        # CloudWatch Metric Stream
        metric_stream = cloudwatch.CfnMetricStream(
            self,
            "CloudWatchMetricStream",
            firehose_arn=firehose_delivery_stream_arn,
            role_arn=metric_stream_role.role_arn,
            output_format=output_format,
            include_filters=[{"Namespace": namespace} for namespace in include_filter],
        )

        # Outputs
        core.CfnOutput(self, "MetricStreamName", value=metric_stream.ref)
        core.CfnOutput(self, "MetricStreamArn", value=metric_stream.attr_arn)
        core.CfnOutput(self, "OutputFormat", value=output_format)
