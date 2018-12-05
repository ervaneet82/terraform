provider "aws" {
  region = "${var.region}"
}

resource "aws_sns_topic" "topic" {
  name = "s3-event-notification-topic"

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "__default_policy_ID",
    "Statement": [
      {
        "Sid": "__default_statement_ID",
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": [
          "SNS:GetTopicAttributes",
          "SNS:SetTopicAttributes",
          "SNS:AddPermission",
          "SNS:RemovePermission",
          "SNS:DeleteTopic",
          "SNS:Subscribe",
          "SNS:ListSubscriptionsByTopic",
          "SNS:Publish",
          "SNS:Receive"
        ],
        "Resource": "arn:aws:sns:us-east-1:536806874885:s3-event-notification-topic",
        "Condition": {
          "ArnLike": {
            "aws:SourceArn": "arn:aws:s3:*:*:vaneet"
          }
        }
      }
    ]
  }
POLICY
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "vaneet"

  topic {
    topic_arn = "${aws_sns_topic.topic.arn}"
    events    = ["s3:ObjectCreated:*"]
  }
}
