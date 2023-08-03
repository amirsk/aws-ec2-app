#!/bin/bash

# Create a temporary directory for packaging the application
temp_dir=$(mktemp -d -t application_package.XXXXXX)

# Copy the necessary files to the temporary directory
cp ../../target/demo-*-SNAPSHOT.jar "$temp_dir/demo.jar"
cp ./appspec.yml "$temp_dir/appspec.yml"
cp ./install_dependencies.sh "$temp_dir/install_dependencies.sh"
cp ./start_application.sh "$temp_dir/start_application.sh"

# Package the files into a ZIP archive
(cd "$temp_dir" && zip -r application_package.zip .)

# Wait for the zip operation to complete before proceeding
wait

# Upload the application revision ZIP file to your S3 bucket
aws s3 cp "$temp_dir/application_package.zip" s3://aws-ec2-starter/application_package.zip

# Clean up the temporary directory
rm -rf "$temp_dir"

# Create a new deployment for your CodeDeploy application
aws deploy create-deployment \
  --application-name aws-ec2-starter \
  --deployment-group-name AwsEc2StarterDeploymentGroup \
  --s3-location bucket=aws-ec2-starter,key=application_package.zip,bundleType=zip