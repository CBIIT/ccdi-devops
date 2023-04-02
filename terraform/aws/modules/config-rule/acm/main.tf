resource "aws_config_config_rule" "acm_certificate_expiration_check" {
  name        = "acm-certificate-expiration-check"
  description = "Checks whether AWS Certificate Manager certificates are expiring in the next 30 days."

  source {
    owner             = "AWS"
    source_identifier = "ACM_CERTIFICATE_EXPIRATION_CHECK"
  }
}