resource "aws_security_group" "app_sg" {
  name        = "${var.program}-${var.tier}-${var.app}-app-sg"
  description = "Associated with the ${var.app}-${var.tier} ecs"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.program}-${var.tier}-${var.app}-ecs"
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
//
//resource "aws_security_group_rule" "ecs_frontend_sg" {
//  security_group_id = aws_security_group.app_sg.id
//  description       = "Allow inbound to 80 port"
//  type              = "ingress"
//  from_port         = 80
//  protocol          = "tcp"
//  to_port           = 80
//  source_security_group_id = var.alb_security_group_id
//}
//
//resource "aws_security_group_rule" "ecs_backend_sg" {
//  security_group_id = aws_security_group.app_sg.id
//  description       = "allow inbound to 8080 port"
//  type              = "ingress"
//  from_port         = 8080
//  protocol          = "tcp"
//  to_port           = 8080
//  source_security_group_id = var.alb_security_group_id
//}
