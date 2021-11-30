resource "aws_s3_bucket" "lamba_s3_bucket" {
  bucket = var.bucketname
  acl    = "private"

  tags = {
    Name        = "jabreels-lambda-logs"
    Environment = "Dev"
  }
}