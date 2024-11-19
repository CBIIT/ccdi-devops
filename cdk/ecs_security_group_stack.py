
from aws_cdk import core
from aws_cdk import aws_ec2 as ec2

class EcsSecurityGroupStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        program: str,
        tier: str,
        vpc_id: str,
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Create the security group
        app_sg = ec2.SecurityGroup(
            self, 
            "AppSecurityGroup",
            vpc=ec2.Vpc.from_lookup(self, "Vpc", vpc_id=vpc_id),
            description=f"Associated with the {app}-{tier} ECS",
            security_group_name=f"{program}-{tier}-{app}-app-sg",
        )
        
        # Add egress (outbound) rule
        app_sg.add_egress_rule(
            peer=ec2.Peer.any_ipv4(),
            connection=ec2.Port.all_traffic(),
            description="Default Outbound Rules"
        )
        
        # Tag the security group
        core.Tags.of(app_sg).add("Name", f"{program}-{tier}-{app}-ecs")
        
        # Outputs
        core.CfnOutput(self, "EcsSecurityGroupId", value=app_sg.security_group_id)
        core.CfnOutput(self, "EcsSecurityGroupArn", value=app_sg.security_group_arn)
