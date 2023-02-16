module "alb" {
  source = "../"

  access_logs_enabled        = true
  access_logs_bucket         = aws_s3_bucket.log_bucket.id
  access_logs_prefix         = null
  app                        = "mtp"
  certificate_arn            = data.aws_acm_certificate.domain.arn
  create_http_listener       = true
  create_https_listener      = true
  env                        = "prod"
  http_port                  = 80
  http_protocol              = "HTTP"
  https_port                 = 443
  https_protocol             = "HTTPS"
  internal                   = terraform.workspace == "dev" || terraform.workspace == "qa" ? true : false
  desync_mitigation_mode     = true
  drop_invalid_header_fields = true
  enable_deletion_protection = true
  enable_http2               = true
  enable_waf_fail_open       = false
  idle_timeout               = 60
  preserve_host_header       = true
  program                    = "ccdi"
  security_groups            = [aws_security_group.alb.id]
  ssl_policy                 = "ELBSecurityPolicy-2016-08"
  subnets                    = data.aws_subnets.public.subnet_ids

  tags = {
    key  = "value",
    key2 = "value2"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "ccdi-prod-mtp-log-bucket"
}

resource "aws_s3_bucket_public_access_block" "log_bucket" {
  bucket                  = aws_s3_bucket.log_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_security_group" "alb" {
  name        = "ccdi-prod-mtp-alb-sg"
  description = "security group for ccdi-prod-mtp-alb"
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "alb_ingress" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow ingress from the internet over HTTPS port 443"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "HTTPS"
  cidr_blocks       = ["0.0.0.0/0"]
}

data "aws_acm_certificate" "domain" {
  domain   = "moleculartargets.ccdi.cancer.gov"
  statuses = ["ISSUED"]
}

data "aws_subnets" "public" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Name"
    values = ["*-ext-*"]
  }
}

data "aws_vpc" "vpc" {

  filter {
    name   = "tag:Name"
    values = ["*prod*"]
  }
}