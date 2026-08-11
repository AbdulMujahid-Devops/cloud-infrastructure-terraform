resource "aws_s3_bucket" "artifacts" {
  bucket_prefix = "${var.name}-artifacts-"

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}
