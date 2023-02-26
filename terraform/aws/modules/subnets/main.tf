##################################################################################################################################
## VPC ###########################################################################################################################
##################################################################################################################################

data "aws_vpc" "vpc" {

  filter {
    name   = "tag:Name"
    values = ["*${var.env}*"]
  }
}

#############################################################
## Public Subnets ###########################################
#############################################################

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Name = "sn-${var.env}-dm*-ext-us-east-*"
  }
}

# data "aws_subnet" "public_1" {
#   id = element(sort(tolist(data.aws_subnets.public.ids)), 0)

#   depends_on = [
#     data.aws_subnets.public
#   ]
# }

# data "aws_subnet" "public_2" {
#   id = element(sort(tolist(data.aws_subnets.public.ids)), 1)

#   depends_on = [
#     data.aws_subnets.public
#   ]
# }

# #############################################################
# ## WebApp Subnets ###########################################
# #############################################################

# data "aws_subnets" "webapp" {

#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }

#   tags = {
#     Name = "sn-${var.env}-webapp-us-east-*"
#   }
# }

# data "aws_subnet" "webapp_1" {
#   id = element(sort(tolist(data.aws_subnets.webapp.ids)), 0)

#   depends_on = [
#     data.aws_subnets.webapp
#   ]
# }

# data "aws_subnet" "webapp_2" {
#   id = element(sort(tolist(data.aws_subnets.webapp.ids)), 1)
# }

# #############################################################
# ## Database Subnets #########################################
# #############################################################

# data "aws_subnets" "database" {

#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }

#   tags = {
#     Name = "sn-${var.env}-db-us-east-*"
#   }
# }

# data "aws_subnet" "database_1" {
#   id = element(sort(tolist(data.aws_subnets.database.ids)), 0)
# }

# data "aws_subnet" "database_2" {
#   id = element(sort(tolist(data.aws_subnets.database.ids)), 1)
# }
