#Here please input the credientials of your aws account
provider "aws" {
    #aws account IAM user's account access_key
    access_key = "${var.aws_access_key}"
    #aws account IAM user's account secret_key
    secret_key = "${var.aws_secret_key}"
    #aws account region
    region     =  "${var.aws_region}"
}


# creating IAM-user resoure name Raman can be replaced with an possible name
resource "aws_iam_user" "Raman" {
  name = "Raman"
  path = "/system/"
  force_destroy = "true"

#specify the tags according to your name
   tags = {
     "Emp.No." = "0001"
     Name  = "Raman"
     Role = "Project Admin"
     Authorities = "Full Admin Access"
     "Emergency Contact No" = "1234567890"
  }

}

#set of credentials that allow API requests to be made as an IAM user.
resource "aws_iam_access_key" "Raman" {
  user = aws_iam_user.Raman.name
}

#setting the user with the policy that we need to assign

resource "aws_iam_policy" "Raman_ro" {
  name        = "AdministartionAccess"
  path        = "/system/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
 policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
  })
}

#Attaching the policy that we had specified to the IAM user.
resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.Raman.name
  policy_arn = aws_iam_policy.Raman_ro.arn
}

# resource "aws_iam_user_login_profile" "Raman" {
#   user    = aws_iam_user.Raman.name
#   pgp_key = "keybase:chowdary"
#   password_length = 10
# }


# output "password" {
#    value = "${aws_iam_user_login_profile.Raman.encrypted_password}"
# }
