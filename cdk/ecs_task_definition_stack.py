
from aws_cdk import core
from aws_cdk import aws_ecs as ecs
from aws_cdk import aws_iam as iam

class EcsTaskDefinitionStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        app: str,
        container_definition_essential: bool,
        container_definition_image: str,
        container_definition_name: str,
        container_port: int,
        cpu: str,
        execution_role_arn: str,
        family: str,
        host_port: int,
        memory: str,
        program: str,
        task_role_arn: str,
        tier: str,
        network_mode: str = "awsvpc",
        requires_compatibilities: str = "FARGATE",
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # IAM roles
        execution_role = iam.Role.from_role_arn(self, "ExecutionRole", execution_role_arn)
        task_role = iam.Role.from_role_arn(self, "TaskRole", task_role_arn)

        # ECS task definition
        task_definition = ecs.TaskDefinition(
            self,
            "EcsTaskDefinition",
            family=family,
            compatibility=ecs.Compatibility.FARGATE if requires_compatibilities.upper() == "FARGATE" else ecs.Compatibility.EC2,
            cpu=cpu,
            memory_mib=memory,
            execution_role=execution_role,
            task_role=task_role,
            network_mode=ecs.NetworkMode.AWS_VPC if network_mode.lower() == "awsvpc" else ecs.NetworkMode.HOST,
        )

        # Container definition
        container = task_definition.add_container(
            "ContainerDefinition",
            image=ecs.ContainerImage.from_registry(container_definition_image),
            essential=container_definition_essential,
            container_name=container_definition_name,
        )

        # Add port mappings
        container.add_port_mappings(
            ecs.PortMapping(
                container_port=container_port,
                host_port=host_port,
                protocol=ecs.Protocol.TCP,
            )
        )

        # Outputs
        core.CfnOutput(self, "TaskDefinitionArn", value=task_definition.task_definition_arn)
        core.CfnOutput(self, "TaskDefinitionId", value=task_definition.family)
