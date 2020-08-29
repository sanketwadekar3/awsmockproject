terraform {
    backend "s3" {
        bucket = "20886-akshay"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}
