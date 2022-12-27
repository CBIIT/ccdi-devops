#creating security group for rds

locals {
  nih_cidrs = terraform.workspace == "prod" || terraform.workspace == "stage" ? ["0.0.0.0/0"] : ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
}

#create rds security group
resource "aws_security_group" "rds_sg" {
  name        = "${var.program}-${var.tier}-${var.app}-rds-sg"
  description = "rds security group"
  vpc_id      = var.vpc_id
  tags = {
    "Name" = "${var.program}-${var.tier}-${var.app}-rds-sg"
  }
}

resource "aws_security_group_rule" "allow_backend" {
  from_port         = 3306
  protocol          = "tcp"
  to_port           = 3306
  cidr_blocks       = local.nih_cidrs
  security_group_id = aws_security_group.rds_sg.id
  type              = "ingress"
}

#resource "aws_security_group_rule" "allow_jenkins_host" {
#  count             = terraform.workspace == "prod" ? 1 : 0
#  from_port         = 3306
#  protocol          = "tcp"
#  to_port           = 3306
#  cidr_blocks       = flatten([var.jenkins_ip])
#  security_group_id = aws_security_group.rds_sg.id
#  type              = "ingress"
#}

resource "aws_security_group_rule" "all_outbound_rds" {
  security_group_id = aws_security_group.rds_sg.id
  description       = "Default Outbound Rules"
  type              = "egress"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}