resource "aws_s3_bucket" "golfsmash" {
  bucket = "${var.bucket}"
  acl    = "private"

  tags {
    Name = "wiki"
  }
}

# resource "aws_s3_bucket_object" "directory" {
#   bucket = "${aws_s3_bucket.golfsmash.id}"
#   acl    = "private"
#   key    = "dev"
#   source = "local path/to/directory"
# }

resource "null_resource" "s3upload" {
  provisioner "local-exec" {
    command = "aws s3 cp variables.tf s3://${aws_s3_bucket.golfsmash.bucket}/"
  }
}
