resource "aws_config_config_rule" "autoscaling_capacity_rebalancing" {
  name = "autoscaling-capacity-rebalancing"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_CAPACITY_REBALANCING"
  }
}

resource "aws_config_config_rule" "autoscaling_group_elb_healthcheck_required" {
  name = "autoscaling-group-elb-healthcheck-required"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_GROUP_ELB_HEALTHCHECK_REQUIRED"
  }
}

resource "aws_config_config_rule" "autoscaling_launchconfig_requires_imdsv2" {
  name = "autoscaling-launchconfig-requires-imdsv2"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_LAUNCHCONFIG_REQUIRES_IMDSV2"
  }
}

resource "aws_config_config_rule" "autoscaling_launch_config_hop_limit" {
  name = "autoscaling-launch-config-hop-limit"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_LAUNCH_CONFIG_HOP_LIMIT"
  }
}

resource "aws_config_config_rule" "autoscaling_launch_config_public_ip_disabled" {
  name = "autoscaling-launch-config-public-ip-disabled"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED"
  }
}

resource "aws_config_config_rule" "autoscaling_launch_template" {
  name = "autoscaling-launch-template"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_LAUNCH_TEMPLATE"
  }
}

resource "aws_config_config_rule" "autoscaling_multiple_az" {
  name = "autoscaling-multiple-az"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_MULTIPLE_AZ"
  }
}

resource "aws_config_config_rule" "autoscaling_multiple_instance_types" {
  name = "autoscaling-multiple-instance-types"

  source {
    owner             = "AWS"
    source_identifier = "AUTOSCALING_MULTIPLE_INSTANCE_TYPES"
  }
}

