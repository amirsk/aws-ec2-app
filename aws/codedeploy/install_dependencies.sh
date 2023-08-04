#!/bin/bash

# Script to install dependencies for Java application

# Install Java 11 Amazon Corretto
sudo yum install java-11-amazon-corretto -y

# Download and extract the AWS X-Ray Java agent
XRAY_AGENT_URL="https://github.com/aws/aws-xray-java-agent/releases/latest/download/xray-agent.zip"
XRAY_AGENT_DIR="/home/ec2-user/xray-agent"
mkdir -p ${XRAY_AGENT_DIR}
cd ${XRAY_AGENT_DIR}
curl -LO ${XRAY_AGENT_URL}
unzip xray-agent.zip
chmod +x disco/disco-java-agent.jar
