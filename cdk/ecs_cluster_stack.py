
from aws_cdk import core
from aws_cdk import aws_ecs as ecs

class EcsClusterStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        app: str,
        program: str,
        tier: str,
        container_insights_enabled: str = "enabled",
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # ECS Cluster
        cluster = ecs.Cluster(
            self,
            "EcsCluster",
            cluster_name=f"{program}-{tier}-{app}-cluster",
            container_insights=(container_insights_enabled.lower() == "enabled"),
        )

        # Outputs
        core.CfnOutput(self, "ClusterArn", value=cluster.cluster_arn)
        core.CfnOutput(self, "ClusterName", value=cluster.cluster_name)
        core.CfnOutput(self, "ClusterId", value=cluster.cluster_arn.split("/")[-1])  # Extract ID from ARN
