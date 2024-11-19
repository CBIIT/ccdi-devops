
from aws_cdk import core
from aws_cdk import aws_elasticloadbalancingv2 as elbv2

class TargetGroupStack(core.Stack):
    def __init__(
        self, 
        scope: core.Construct, 
        id: str,
        app: str,
        port: int,
        program: str,
        target_description: str,
        tier: str,
        vpc_id: str,
        health_check_healthy_threshold: int = 5,
        health_check_interval: int = 30,
        health_check_matcher: str = "200",
        health_check_path: str = "/",
        health_check_port: str = "traffic-port",
        health_check_protocol: str = "HTTP",
        health_check_timeout: int = 10,
        health_check_unhealthy_threshold: int = 5,
        protocol: str = "HTTP",
        stickiness_cookie_duration: int = 1800,
        stickiness_enabled: bool = True,
        stickiness_type: str = "lb_cookie",
        target_type: str = "ip",
        **kwargs
    ) -> None:
        super().__init__(scope, id, **kwargs)
        
        # Create the target group
        elbv2.TargetGroup(
            self, 
            "TargetGroup",
            target_group_name=f"{program}-{tier}-{target_description}",
            port=port,
            protocol=elbv2.Protocol.HTTP if protocol.upper() == "HTTP" else elbv2.Protocol.HTTPS,
            target_type=elbv2.TargetType.IP if target_type.lower() == "ip" else elbv2.TargetType.INSTANCE,
            vpc_id=vpc_id,
            health_check=elbv2.HealthCheck(
                healthy_threshold_count=health_check_healthy_threshold,
                interval=core.Duration.seconds(health_check_interval),
                path=health_check_path,
                port=health_check_port,
                protocol=elbv2.Protocol.HTTP if health_check_protocol.upper() == "HTTP" else elbv2.Protocol.HTTPS,
                timeout=core.Duration.seconds(health_check_timeout),
                unhealthy_threshold_count=health_check_unhealthy_threshold,
                matcher=elbv2.HttpCodeTarget(matcher=health_check_matcher),
            ),
            stickiness_cookie_duration=core.Duration.seconds(stickiness_cookie_duration) if stickiness_enabled else None,
            stickiness_type=stickiness_type if stickiness_enabled else None
        )
