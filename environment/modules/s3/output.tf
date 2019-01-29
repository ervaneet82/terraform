output "bucket_arn" {
  description = "Bucket Name"
  value       = "${aws_s3_bucket.golfsmash.arn}"
}
