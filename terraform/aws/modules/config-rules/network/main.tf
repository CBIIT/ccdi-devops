resource "aws_config_config_rule" "vpc_default_security_group_closed" {
  name = "vpc-default-security-group-closed"

  source {
    owner             = "AWS"
    source_identifier = "VPC_DEFAULT_SECURITY_GROUP_CLOSED"
  }
}

resource "aws_config_config_rule" "vpc_flow_logs_enabled" {
  name = "vpc-flow-logs-enabled"

  source {
    owner             = "AWS"
    source_identifier = "VPC_FLOW_LOGS_ENABLED"
  }
}

resource "aws_config_config_rule" "vpc_network_acl_unused_check" {
  name = "vpc-network-acl-unused-check"

  source {
    owner             = "AWS"
    source_identifier = "VPC_NETWORK_ACL_UNUSED_CHECK"
  }
}

resource "aws_config_config_rule" "vpc_sg_open_only_to_authorized_ports" {
  name = "vpc-sg-open-only-to-authorized-ports"

  source {
    owner             = "AWS"
    source_identifier = "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS"
  }
}

resource "aws_config_config_rule" "vpc_vpn_2_tunnels_up" {
  name = "vpc-vpn-2-tunnels-up"
  source {
    owner             = "AWS"
    source_identifier = "VPC_VPN_2_TUNNELS_UP"
  }
}
