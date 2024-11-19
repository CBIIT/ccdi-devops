
from aws_cdk import core
from aws_cdk import aws_s3 as s3

class S3BucketStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        bucket_name: str,
        level: str,
        program: str,
        block_public_acls: bool = True,
        block_public_policy: bool = True,
        ignore_public_acls: bool = True,
        restrict_public_buckets: bool = True,
        version_configuration_status: str = "Enabled",
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Create the S3 bucket
        bucket = s3.Bucket(
            self,
            "S3Bucket",
            bucket_name=f"{program}-{level}-{app}-{bucket_name}",
            versioned=(version_configuration_status == "Enabled"),
            block_public_access=s3.BlockPublicAccess(
                block_public_acls=block_public_acls,
                block_public_policy=block_public_policy,
                ignore_public_acls=ignore_public_acls,
                restrict_public_buckets=restrict_public_buckets
            ),
            encryption=s3.BucketEncryption.S3_MANAGED,
        )
        
        # Outputs
        core.CfnOutput(self, "BucketArn", value=bucket.bucket_arn)
        core.CfnOutput(self, "BucketName", value=bucket.bucket_name)
        core.CfnOutput(self, "BucketRegionalDomainName", value=bucket.bucket_regional_domain_name)
        core.CfnOutput(self, "BucketId", value=bucket.bucket_name)  # ID is often the same as name for S3
