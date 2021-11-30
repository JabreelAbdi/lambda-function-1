terraform {
  backend "s3" {
    bucket = "talent-academy-jabreelabdi"
    key    = "terraform-lambda1/terraform.tfstates"
  }
}