import requests
import base64
import boto3

import boto3
s3 = boto3.client('s3')
bucket = 'casa-pet'

# key_name = 'name-of-file-in-s3'
# s3.upload_file(file_name, bucket, key_name)

s3_client = boto3.resource('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                           aws_secret_access_key="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")
s3 = boto3.client('s3', aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
                  aws_secret_access_key="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")
bucket_name = 'casa-pet'
object_name = "klee.png"

# import io
# import boto3

# s3 = boto3.client('s3')

# fo = io.BytesIO(b'my data stored as file object in RAM')
# s3.upload_fileobj(fo, 'mybucket', 'hello.txt')

# where the file will be uploaded, if you want to upload the file to folder use 'Folder Name/FileName.jpeg'

# make sure there is no data:image/jpeg;base64 in the string that returns


response = s3.generate_presigned_url('get_object', Params={'Bucket': bucket_name, 'Key': object_name},
                                     )
print(response)

# url = s3.create_presigned_url(bucket_name, object_name)
# if url is not None:
#     response = requests.get(url)

# print(url)


# import boto3

# BUCKET_NAME = "casa-pet"

# s3 = boto3.client("s3", aws_access_key_id='AKIAUUUNYLUHHNX37WF2',
#                   aws_secret_access_key="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")

# # buckets_resp = s3.list_buckets()
# # for bucket in buckets_resp["Buckets"]:
# #     print(bucket)

# s3.put_object(Body=more_binary_data, Bucket='my_bucket_name', Key='my/key/including/anotherfilename.txt')
# # List all objects in a bucket
# response = s3.list_objects_v2(Bucket=BUCKET_NAME)
# for obj in response["Contents"]:
#     print(obj)

# # # Upload file to bucket [Show with public-read, and without it too]
# # with open("./burger.jpg", "rb") as f:
# #     print(f.name)
# #     s3.upload_fileobj(f, BUCKET_NAME, "burger.jpg", ExtraArgs={"ACL": "public-read"})

# # # Download File
# # s3.download_file(BUCKET_NAME, "burger.jpg", "downloaded_burger.jpg")

# # # Download File with reference
# # with open("downloaded_burger.jpg", "wb") as f:
# #     s3.download_fileobj(BUCKET_NAME, "burger.jpg", f)

# # # Presigned URL to give limited access to an unauthorized user
# # url = s3.generate_presigned_url(
# #     "get_object", Params={"Bucket": BUCKET_NAME, "Key": "burger.jpg"}, ExpiresIn=30
# )
# print(url)


# # Create Bucket
# bucket_location = s3.create_bucket(ACL="public-read", Bucket="new-copy-destination-123")
# print(bucket_location)

# # Copy object
# response = s3.copy_object(
#     ACL="public-read",
#     Bucket="new-copy-destination-123",
#     CopySource=f"/{BUCKET_NAME}/burger.jpg",
#     Key="CopiedBurger.jpg",
# )
# print(response)

# # Get Object
# response = s3.get_object(Bucket=BUCKET_NAME, Key="burger.jpg")
# print(response)
