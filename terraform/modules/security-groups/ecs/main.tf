resource "aws_security_group" "app_sg" {
  name   =  "${var.program}-${var.app}-${var.tier}-app-sg"
  description = "Associated with the ${var.app}-${var.tier} ecs"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.program}-${var.app}-${var.tier}-ecs"
  }
}

resource "aws_security_group_rule" "all_outbound_frontend" {
  security_group_id = aws_security_group.app_sg.id
  description       = "Default Outbound Rules"
  type              = "egress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

