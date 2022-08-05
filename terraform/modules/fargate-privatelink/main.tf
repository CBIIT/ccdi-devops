resource "aws_vpc_endpoint" "s3" {
  vpc_id            = data.aws_vpc.selected.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"

  tags = {
    "Name" = "${var.app}-s3-endpoint"
  }
}

resource "aws_vpc_endpoint" "dkr" {
  vpc_id              = data.aws_vpc.selected.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"

  tags = {
    Name = "${var.app}-dkr-endpoint"
  }
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = data.aws_vpc.selected.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.us-east-1.logs"
  vpc_endpoint_type   = "Interface"

  tags = {
    Name = "${var.app}-logs-endpoint"
  }
}

resource "aws_vpc_endpoint_security_group_association" "vpce" {
  vpc_endpoint_id   = var.aws_vpc_endpoint.vpce.id
  security_group_id = var.security_group_id
}

resource "aws_security_group" "vpce" {
  # checkov:skip=CKV2_AWS_5: stand-alone security group
  name                   = "${var.app}-${terraform.tier}-vpce"
  description            = "The VPC Endpoint Security Group"
  revoke_rules_on_delete = true
  vpc_id                 = data.aws_vpc.selected.id

  tags = {
    Name = "${var.app}-${var.tier}-vpce"
  }
}

resource "aws_security_group_rule" "vpce" {
  security_group_id = aws_security_group.vpce.id
  description       = "Allow traffic originating from within the dev-tier VPC"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = [data.aws_vpc.selected.cidr_block]

  tags {
    Name = "inboundVPC"
  }
}
