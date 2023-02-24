output "public_all_ids" {
  value       = data.aws_subnets.public.ids
  description = "the ids of both public subnets in the vpc"
}

output "public_1_id" {
  value       = data.aws_subnet.public_1.id
  description = ""
}

output "public_2_id" {
  value       = data.aws_subnet.public_2.id
  description = ""
}

output "webapp_all_ids" {
  value       = data.aws_subnets.webapp.ids
  description = "the ids of both webapp subnets in the vpc"
}

output "webapp_1_id" {
  value       = data.aws_subnet.webapp_1.id
  description = ""
}

output "webapp_2_id" {
  value       = data.aws_subnet.webapp_2.id
  description = ""
}

output "database_all_ids" {
  value       = data.aws_subnets.database.ids
  description = "the ids of both database subnets in the vpc"
}

output "database_1_id" {
  value       = data.aws_subnet.database_1.id
  description = ""
}

output "database_2_id" {
  value       = data.aws_subnet.database_2.id
  description = ""
}