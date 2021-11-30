import boto3
s3_client = boto3.resource('s3')

jabreel_bucket = s3_client.create_bucket(Bucket='jabreel.gets.buckets')