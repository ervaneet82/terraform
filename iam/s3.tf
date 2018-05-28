resource "aws_s3_bucket" "terraform_test" {
  bucket = "${var.bucket}"
  acl    = "private"

  tags {
    Name = "vaneet"
  }
}
