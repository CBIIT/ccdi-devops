resource "aws_security_group" "alb" {
  name        = "${var.program}-${var.app}-${var.tier}-alb"
  description = "Associated with the ${var.app}-${var.tier} alb"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.program}-${var.app}-${var.tier}-alb"
  }
}

resource "aws_security_group_rule" "alb_inbound_http" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow inbound http traffic from the internet or nih network"
  type              = "ingress"
  from_port         = 80
  protocol          = "HTTP"
  to_port           = 80
  cidr_blocks       = var.security_group_ingress_cidr
}

resource "aws_security_group_rule" "alb_inbound_https" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow inbound https traffic from the internet or nih network"
  type              = "ingress"
  from_port         = 443
  protocol          = "HTTP"
  to_port           = 443
  cidr_blocks       = var.security_group_ingress_cidr
}
