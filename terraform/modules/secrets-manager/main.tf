resource "aws_secretsmanager_secret" "secrets_manager"{
  name         = local.secret_manager_name
  description  = "ManagedbyTerraform"
}

resource "aws_secretsmanager_secret_version" "secret"{
  secret_id = aws_secretsmanager_secret.secrets_manager.id
  secret_string = jsonencode(merge(
  {
    "neo4j_password" : "${random_password.neo4j_password.result}"
  },
  var.secrets))
  depends_on=[
    aws_secretsmanager_secret.secrets_manager
  ]
}

resource "random_password" "neo4j_password"{
  length = 13
  special = true
  override_special = "@%"
  keepers = {
    keep=true
  }
  min_upper = 1
  min_lower = 1
  min_numeric = 1
  min_special = 1
}
