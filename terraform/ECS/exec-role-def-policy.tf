resource "aws_iam_role_policy" "iam-policy" {
  name   = "ECS-execution-role-policy"
  role   = aws_iam_role.iam-role.id
  policy = file("${path.module}/exec-role-def-policy.json")
}