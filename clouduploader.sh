#!/bin/bash

# author:aexteck
# Description:
# A bash script that allows users to quickly upload files to a specified
# cloud storage solution.

# Usage: ./clouduploader.sh

filename=$1
bucketname=$2

# Check if the file exists
if [ -f "$filename" ]; then
  echo "$filename found, proceeding with upload"
else
  echo "error: file does not exist."
exit 2
fi

# Check if the bucket exists 

if [ -d "$bucketname"]; then 
   echo "$bucketname exists, proceeding to upload"
else
   echo "error: bucket does not exist." 
exit 2
fi

# Perform the upload
upload_output=$(aws s3 cp "$filename" s3://"$bucket_name"/ 2>&1)
upload_status=$?

if [ $upload_status -eq 0 ]; then
    echo "Upload successful!"
else
    echo "Upload failed: $upload_output."
exit 3
fi
