resource "aws_iam_instance_profile" "this" {
  name = "power-user-${local.stack}-jenkins-instance-profile-role"
}

resource "aws_iam_role" "this" {
  name = "power-user-${local.stack}-jenkins-instance-profile-role"
}

