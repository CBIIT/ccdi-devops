
from aws_cdk import core
from aws_cdk import aws_ec2 as ec2

class RdsSecurityGroupStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        program: str,
        tier: str,
        vpc_id: str,
        workspace: str,
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Define CIDR blocks based on workspace
        nih_cidrs = (
            ["0.0.0.0/0"]
            if workspace in ["prod", "stage"]
            else [
                "129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16",
                "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16",
                "157.98.0.0/16", "10.133.0.0/16"
            ]
        )
        
        # Create the security group
        rds_sg = ec2.SecurityGroup(
            self, 
            "RdsSecurityGroup",
            vpc=ec2.Vpc.from_lookup(self, "Vpc", vpc_id=vpc_id),
            description="RDS security group",
            security_group_name=f"{program}-{tier}-{app}-rds-sg",
        )
        
        # Add ingress rules
        for cidr in nih_cidrs:
            rds_sg.add_ingress_rule(
                peer=ec2.Peer.ipv4(cidr),
                connection=ec2.Port.tcp(3306),  # Default MySQL port
                description=f"Allow access from {cidr}"
            )
        
        # Expose outputs
        core.CfnOutput(self, "SecurityGroupId", value=rds_sg.security_group_id)
        core.CfnOutput(self, "SecurityGroupArn", value=rds_sg.security_group_arn)
