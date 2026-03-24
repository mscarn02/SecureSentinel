# terraform/main.tf

provider "aws" {
  region = "us-east-1"
}

# SECURITY VIOLATION: An unencrypted S3 bucket without versioning
resource "aws_s3_bucket" "nimbusguard_storage" {
  bucket = "nimbusguard-event-logs-public-test"
}

# SECURITY VIOLATION: Explicitly allowing public access
resource "aws_s3_bucket_public_access_block" "nimbusguard_storage_access" {
  bucket = aws_s3_bucket.nimbusguard_storage.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}