data "aws_iam_policy_document" "force_mfa" {
statement {
  sid = "BlockAccessUnlessMFAEnabled"
  effect = "Deny"
  not_actions = ["iam:*"]
  resources = ["*"]
  condition {
    test = "BoolIfExists"
    variable = "aws:MultiFactorAuthPresent"
    values = [
      "false"
    ]
  }
}
}