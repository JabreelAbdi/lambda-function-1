resource "aws_s3_bucket" "lamba_s3_bucket" {
  bucket = var.bucketname


  tags = {
    Name        = var.bucketname
    Environment = "Test"
  }
}