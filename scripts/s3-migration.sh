#!/bin/bash
# Purpose: Automate secure S3 data migration and consistency verification
# Target Region: us-east-1

SOURCE_BUCKET="s3://datacenter-s3-24462"
DEST_BUCKET="s3://datacenter-sync-23990"
DEST_BUCKET_NAME="datacenter-sync-23990"

echo "🚀 Step 1: Creating destination bucket..."
aws s3api create-bucket --bucket $DEST_BUCKET_NAME --region us-east-1

echo "🔄 Step 2: Syncing data from source to destination..."
aws s3 sync $SOURCE_BUCKET $DEST_BUCKET

echo "✅ Step 3: Verifying data consistency..."
echo "--- Source Bucket Contents ---"
aws s3 ls $SOURCE_BUCKET --recursive
echo "--- Destination Bucket Contents ---"
aws s3 ls $DEST_BUCKET --recursive
