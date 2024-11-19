
from aws_cdk import core
from aws_cdk import aws_ec2 as ec2

class OpenSearchSecurityGroupStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        allow_nih_access: bool,
        app: str,
        program: str,
        tier: str,
        vpc_id: str,
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Define NIH CIDR blocks
        nih_cidr = [
            "129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16",
            "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16",
            "157.98.0.0/16", "10.133.0.0/16"
        ]
        
        # Create the security group
        opensearch_sg = ec2.SecurityGroup(
            self, 
            "OpenSearchSecurityGroup",
            vpc=ec2.Vpc.from_lookup(self, "Vpc", vpc_id=vpc_id),
            description="Security group associated with the OpenSearch cluster",
            security_group_name=f"{program}-{tier}-{app}-opensearch",
        )
        
        # Conditionally add NIH ingress rules
        if allow_nih_access:
            for cidr in nih_cidr:
                opensearch_sg.add_ingress_rule(
                    peer=ec2.Peer.ipv4(cidr),
                    connection=ec2.Port.tcp(443),  # Default HTTPS port
                    description=f"Allow access from NIH CIDR {cidr}"
                )
        
        # Outputs
        core.CfnOutput(self, "SecurityGroupId", value=opensearch_sg.security_group_id)
        core.CfnOutput(self, "SecurityGroupArn", value=opensearch_sg.security_group_arn)
