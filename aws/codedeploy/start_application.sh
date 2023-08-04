#!/bin/bash

APP_DIR=/home/ec2-user/app
APP_LOG_DIR=/home/ec2-user/app/log

mkdir -p ${APP_LOG_DIR}
chmod 755 ${APP_LOG_DIR}/
touch ${APP_LOG_DIR}/app.log
chmod 644 ${APP_LOG_DIR}/app.log
chown -R ec2-user ${APP_LOG_DIR}
chown -R ec2-user ${APP_DIR}

# Set the AWS X-Ray Java agent path
XRAY_AGENT_DIR="/home/ec2-user/xray-agent"
XRAY_AGENT_PATH="${XRAY_AGENT_DIR}/disco/disco-java-agent.jar=pluginPath=${XRAY_AGENT_DIR}/disco/disco-plugins"

su - ec2-user -c "java \
  -javaagent:${XRAY_AGENT_PATH} \
  -Dcom.amazonaws.xray.alloy=true \
  -jar ${APP_DIR}/demo.jar > ${APP_LOG_DIR}/app.log 2>&1 &"

exit 0