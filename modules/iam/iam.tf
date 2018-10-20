resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2-role" {
  name = "ec2-role"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role_policy" "ec2-role-policy" {
  name = "ec2-role-policy"
  role = "${aws_iam_role.ec2_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
 "Statement": [
   {
     "Effect": "Allow",
     "Action": ["s3:ListBucket"],
     "Resource": ["arn:aws:s3:::${var.bucket}"]
   },
   {
     "Effect": "Allow",
     "Action": [
       "s3:*",
       "s3:GetObject",
       "s3:DeleteObject"
     ],
     "Resource": ["arn:aws:s3:::${var.bucket}/*"]
   }
 ]
 }
EOF
}
