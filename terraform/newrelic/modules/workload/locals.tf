locals {
  workload_query = "((name LIKE '${var.app}-' OR id = '${var.app}-' OR domainId = '${var.app}-') OR (name LIKE '-${var.app}' OR id = '-${var.app}' OR domainId = '-${var.app}')) AND (name LIKE '${var.tier}' OR id = '${var.tier}' OR domainId = '${var.tier}')"
}
