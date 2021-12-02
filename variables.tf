variable "lambda_role_name" {
  description = "Name of the role for my lambda function"
  default = "iam-for-lambda"
}
variable "bucketname" {
  description = "This is the name of the s3 bucket"
}

variable "pet_script_filename" {
  description = "The file name of my pet script"
}