#!/usr/bin/env python3
from aws_cdk import core
from target_group_stack import TargetGroupStack  # Replace with the correct relative path if necessary

class MyApp(core.App):
    def __init__(self):
        super().__init__()
        
        # Initialize the stack
        TargetGroupStack(
            self,
            "ccdi_hub_stack",
            app="hub",
            port=80,
            program="ccdi",
            target_description="frontend",
            tier="dev",
            vpc_id="vpc-12345678",  # Replace with your VPC ID
            health_check_healthy_threshold=3,
            health_check_interval=20,
            health_check_path="/health",
            health_check_protocol="HTTP",
            stickiness_cookie_duration=3600,
        )

if __name__ == "__main__":
    app = MyApp()
    app.synth()