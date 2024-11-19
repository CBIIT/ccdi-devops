
from aws_cdk import core
from aws_cdk import aws_ecr as ecr
from aws_cdk import aws_iam as iam

class EcrStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        account_level: str,
        app: str,
        program: str,
        repo_type: str,
        image_tag_mutability: str = "MUTABLE",
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # ECR Repository
        repository_name = f"{program}-{account_level}-{app}-{repo_type}"
        ecr_repo = ecr.Repository(
            self,
            "EcrRepository",
            repository_name=repository_name,
            image_tag_mutability=(
                ecr.TagMutability.MUTABLE
                if image_tag_mutability.upper() == "MUTABLE"
                else ecr.TagMutability.IMMUTABLE
            ),
        )

        # ECR Lifecycle Policy
        ecr_repo.add_lifecycle_rule(
            description="Remove untagged images after 30 days",
            tag_status=ecr.TagStatus.UNTAGGED,
            max_image_age=core.Duration.days(30),
        )

        # ECR Repository Policy
        ecr_repo.add_to_resource_policy(
            iam.PolicyStatement(
                actions=["ecr:*"],
                principals=[iam.AnyPrincipal()],
                resources=[ecr_repo.repository_arn],
                effect=iam.Effect.ALLOW,
            )
        )

        # Outputs
        core.CfnOutput(self, "EcrRepositoryUri", value=ecr_repo.repository_uri)
        core.CfnOutput(self, "EcrRepositoryArn", value=ecr_repo.repository_arn)
