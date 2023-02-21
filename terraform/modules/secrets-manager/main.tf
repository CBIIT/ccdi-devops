resource "aws_secretsmanager_secret" "secret" {
  name        = local.secret_manager_name
  description = "Credentials used for monitoring and database services"
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(
    merge(
      { "neo4j_password" : "${random_password.neo4j_password.result}" },
      var.secrets
    )
  )
  depends_on = [
    aws_secretsmanager_secret.secret
  ]
}

resource "random_password" "neo4j_password" {
  length           = 13
  special          = true
  override_special = "@%"
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1

  keepers = {
    keep = true
  }
}
