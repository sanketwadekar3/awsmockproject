resource "aws_s3_bucket" "kbucket" {
  bucket = var.bucketname 
  
  website {
    index_document = "home.html"
}
}

