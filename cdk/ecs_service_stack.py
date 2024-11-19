
from aws_cdk import core
from aws_cdk import aws_ecs as ecs
from aws_cdk import aws_ec2 as ec2
from aws_cdk import aws_elasticloadbalancingv2 as elbv2

class EcsServiceStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        app: str,
        cluster_id: str,
        container_name: str,
        container_port: int,
        ecs_service_name: str,
        program: str,
        security_group_ids: set,
        target_group_arn: str,
        task_definition: str,
        tier: str,
        webapp_subnets: set,
        assign_public_ip: bool = False,
        deployment_circuit_breaker_enable: bool = True,
        deployment_circuit_breaker_rollback: bool = True,
        deployment_controller_type: str = "ECS",
        deployment_maximum_percent: int = 200,
        deployment_minimum_healthy_percent: int = 50,
        desired_count: int = 2,
        enable_ecs_managed_tags: bool = True,
        launch_type: str = "FARGATE",
        scheduling_strategy: str = "Replica",
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # ECS Cluster
        cluster = ecs.Cluster.from_cluster_attributes(
            self,
            "Cluster",
            cluster_name=cluster_id,
            vpc=ec2.Vpc.from_vpc_attributes(
                self,
                "Vpc",
                vpc_id=webapp_subnets,
            ),
        )

        # Security groups
        security_groups = [
            ec2.SecurityGroup.from_security_group_id(self, f"SG{i}", sg)
            for i, sg in enumerate(security_group_ids)
        ]

        # Target group
        target_group = elbv2.ApplicationTargetGroup.from_target_group_attributes(
            self,
            "TargetGroup",
            target_group_arn=target_group_arn,
        )

        # ECS Service
        ecs_service = ecs.FargateService(
            self,
            "EcsService",
            cluster=cluster,
            service_name=ecs_service_name,
            task_definition=ecs.TaskDefinition.from_task_definition_arn(
                self, "TaskDef", task_definition
            ),
            security_groups=security_groups,
            assign_public_ip=assign_public_ip,
            desired_count=desired_count,
            deployment_controller=ecs.DeploymentController(
                type=ecs.DeploymentControllerType.ECS
                if deployment_controller_type.upper() == "ECS"
                else ecs.DeploymentControllerType.CODE_DEPLOY
            ),
            health_check_grace_period=core.Duration.minutes(5),
            enable_ecs_managed_tags=enable_ecs_managed_tags,
            vpc_subnets=ec2.SubnetSelection(subnets=[
                ec2.Subnet.from_subnet_id(self, f"Subnet{i}", subnet)
                for i, subnet in enumerate(webapp_subnets)
            ]),
        )

        # Outputs
        core.CfnOutput(self, "EcsServiceId", value=ecs_service.service_arn)
        core.CfnOutput(self, "EcsServiceName", value=ecs_service.service_name)
