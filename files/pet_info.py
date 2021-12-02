import boto3

def pet_info(event, context):
    s3_client = boto3.client('s3')


    target_bucket_name = event["S3Bucket"]


    my_buckets_raw = s3_client.list_buckets()


    for b in my_buckets_raw["Buckets"]:
        print("Name of bucket : " + b["Name"])
