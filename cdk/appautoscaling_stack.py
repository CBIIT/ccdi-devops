
from aws_cdk import core
from aws_cdk import aws_applicationautoscaling as appautoscaling

class AppAutoScalingStack(core.Stack):
    def __init__(
        self,
        scope: core.Construct,
        id: str,
        resource_id: str,
        scalable_dimension: str,
        service_namespace: str,
        min_capacity: int,
        max_capacity: int,
        policy_name: str,
        target_value: float,
        **kwargs,
    ) -> None:
        super().__init__(scope, id, **kwargs)

        # Create the scalable target
        scalable_target = appautoscaling.ScalableTarget(
            self,
            "ScalableTarget",
            service_namespace=service_namespace,
            scalable_dimension=scalable_dimension,
            resource_id=resource_id,
            min_capacity=min_capacity,
            max_capacity=max_capacity,
        )

        # Create the scaling policy
        scaling_policy = appautoscaling.TargetTrackingScalingPolicy(
            self,
            "ScalingPolicy",
            scalable_target=scalable_target,
            policy_name=policy_name,
            target_value=target_value,
            predefined_metric=appautoscaling.PredefinedMetric.ECS_SERVICE_AVERAGE_CPU_UTILIZATION,
        )

        # Outputs
        core.CfnOutput(self, "ScalableTargetId", value=scalable_target.scalable_target_id)
        core.CfnOutput(self, "ScalingPolicyName", value=scaling_policy.policy_name)
