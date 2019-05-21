#---------S3/main.tf------

# Create a random id

resource "random_id" "tf_bucket_id" {
  byte_length = "${var.byte_length}"
}

# Create bucket

resource "aws_s3_bucket" "tf_code" {
  bucket        = "${var.bucket_name}-${random_id.tf_bucket_id.dec}"
  acl           = "private"
  force_destroy = true

  tags {
    Name = "${var.bucket_tags}"
  }
}
