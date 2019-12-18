resource "aws_iam_user" "user" {
    name = "${var.name}"

}

resource "aws_iam_user_group_membership" "membership" {
    user = "${aws_iam_user.user.name}"
    groups = ["${data.aws_iam_group.group.group_name}"]
}

resource "aws_iam_user_login_profile" "login_profile" {
    user = "${aws_iam_user.user.name}"
    pgp_key = "${var.pgp_key}"
    password_reset_required = true
}

data "aws_iam_group" "group" {
    group_name = "${var.group_name}"
}

resource "aws_iam_policy" "mfa-policy" {
    name = "${var.name}-mfa"
    path = "/"
    policy = "${data.aws_iam_policy_document.force_mfa.json}"
}

resource "aws_iam_user_policy_attachment" "mfa-policy" {
    user = "${aws_iam_user.user.name}"
    policy_arn = "${aws_iam_policy.mfa-policy.arn}"
}