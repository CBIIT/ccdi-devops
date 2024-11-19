
from aws_cdk import core
from aws_cdk import aws_secretsmanager as secretsmanager
from aws_cdk import aws_iam as iam
import random
import string

class SecretsManagerStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        program: str,
        tier: str,
        secrets: dict = {},
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Function to generate random password (simulate the Terraform random_password)
        def generate_random_password(length=16):
            characters = string.ascii_letters + string.digits + "!@#$%^&*()"
            return ''.join(random.choice(characters) for _ in range(length))
        
        # Generate a random password for Neo4j
        neo4j_password = generate_random_password()
        
        # Create a Secrets Manager secret for Neo4j
        neo4j_secret = secretsmanager.Secret(
            self, 
            "Neo4jPasswordSecret",
            secret_name=f"{program}-{tier}-{app}-neo4j-password",
            generate_secret_string=secretsmanager.SecretStringGenerator(
                secret_string_template='{"username":"neo4j"}',
                generate_string_key="password",
                exclude_characters=""@/\",
            )
        )
        
        # Add additional secrets if provided
        for secret_key, secret_value in secrets.items():
            secretsmanager.Secret(
                self,
                f"{secret_key.capitalize()}Secret",
                secret_name=f"{program}-{tier}-{app}-{secret_key}",
                secret_string_value=secret_value,
            )
        
        # Outputs
        core.CfnOutput(self, "Neo4jPassword", value=neo4j_password)
        core.CfnOutput(self, "SecretManagerArn", value=neo4j_secret.secret_arn)
        core.CfnOutput(self, "SecretManagerId", value=neo4j_secret.secret_name)
