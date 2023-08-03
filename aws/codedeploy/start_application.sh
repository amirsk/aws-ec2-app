#!/bin/bash

# Script to start your Java application
# Replace "demo.jar" with the actual JAR file name

java -jar ./demo.jar > ./application.log 2>&1 &
