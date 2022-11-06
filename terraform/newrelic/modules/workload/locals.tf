locals {
  query_dev = "((name LIKE '${var.app}-') OR (name like '-${var.app}')) AND ((name LIKE '-dev') OR (name LIKE 'dev-'))"
  query_qa = "((name LIKE '${var.app}-') OR (name like '-${var.app}')) AND ((name LIKE '-qa') OR (name LIKE 'qa-'))"
  query_stage = "((name LIKE '${var.app}-') OR (name like '-${var.app}')) AND ((name LIKE '-stage') OR (name LIKE 'stage-'))"
  query_prod = "((name LIKE '${var.app}-') OR (name like '-${var.app}')) AND ((name LIKE '-prod') OR (name LIKE 'prod-'))"
}

