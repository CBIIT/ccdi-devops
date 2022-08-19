resource "aws_security_group" "opensearch" {
  name        = "${var.program}-${var.app}-${var.tier}-opensearch"
  description = "Security group associated with the OpenSearch cluster"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.program}-${var.app}-${var.tier}-opensearch"
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