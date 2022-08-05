#still in progress, need to add security groups that capture all vpcs in account


resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids

  tags = {
    "Name" = "${var.app}-s3-endpoint"
  }
}

resource "aws_vpc_endpoint" "dkr" {
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type   = "Interface"

  tags = {
    Name = "${var.app}-dkr-endpoint"
  }
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = aws_vpc.main.id
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

### Security Group and Rules
### Probably need a for each expression below for dev VPC and qa VPC
resource "aws_security_group" "vpce" {
  name                   = "${var.app}-${var.account_level}-vpce"
  description            = "The VPC Endpoint Security Group"
  revoke_rules_on_delete = true
  vpc_id                 = var.vpc_id
}

resource "aws_security_group_rule" "vpce" {
  security_group_id = aws_security_group.vpce.id
  description       = "Allow traffic originating from within the dev-tier VPC"
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  cidr_blocks       = [var.vpc_cidr]
}
