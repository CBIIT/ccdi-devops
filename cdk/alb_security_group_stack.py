
from aws_cdk import core
from aws_cdk import aws_ec2 as ec2

class AlbSecurityGroupStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        program: str,
        tier: str,
        vpc_id: str,
        security_group_ingress_cidr: list,
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Create the security group
        alb_sg = ec2.SecurityGroup(
            self, 
            "AlbSecurityGroup",
            vpc=ec2.Vpc.from_lookup(self, "Vpc", vpc_id=vpc_id),
            description=f"Associated with the {app}-{tier} ALB",
            security_group_name=f"{program}-{tier}-{app}-alb",
        )
        
        # Add ingress rules
        for cidr in security_group_ingress_cidr:
            alb_sg.add_ingress_rule(
                peer=ec2.Peer.ipv4(cidr),
                connection=ec2.Port.tcp(80),  # HTTP traffic
                description=f"Allow inbound HTTP traffic from {cidr}"
            )
        
        # Tag the security group
        core.Tags.of(alb_sg).add("Name", f"{program}-{tier}-{app}-alb")
        
        # Outputs
        core.CfnOutput(self, "AlbSecurityGroupId", value=alb_sg.security_group_id)
        core.CfnOutput(self, "AlbSecurityGroupArn", value=alb_sg.security_group_arn)
