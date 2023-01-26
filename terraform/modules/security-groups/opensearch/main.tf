locals {
  nih_cidr = ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
}

resource "aws_security_group" "opensearch" {
  # checkov:skip=CKV2_AWS_5: No need to attach to another resource
  name        = "${var.program}-${var.tier}-${var.app}-opensearch"
  description = "Security group associated with the OpenSearch cluster"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.program}-${var.tier}-${var.app}-opensearch"
  }
}

resource "aws_security_group_rule" "outbound_all" {
  security_group_id = aws_security_group.opensearch.id
  description       = "Default Outbound Rules"
  type              = "egress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}

resource "aws_security_group_rule" "inbound_ecs" {

  security_group_id = aws_security_group.opensearch.id
  description       = "Allowing access from ecs containers"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  source_security_group_id = var.ecs_security_group_id
}

resource "aws_security_group_rule" "inbound_nih_network" {
  security_group_id = aws_security_group.opensearch.id
  description       = "Allowing accessfrom jenkins slave for dataloading"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = var.jenkins_IP
}
