resource "aws_s3_bucket_object" "object" {
  bucket = var.bucketid
  key    = var.key
  source = var.s3source  
}