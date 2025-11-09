#!/bin/bash

TELEGRAM_TOKEN="********************************************************"
CHAT_ID="******************"
CI_JOB_STATUS=$1

if [ -z "$CI_JOB_STATUS" ]; then
  echo "Error: CI_JOB_STATUS not provided"
  exit 1
fi

response=$(curl -s -w "%{http_code}" -o /dev/null -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$CHAT_ID" -d text="Pipeline status: $CI_JOB_STATUS")

if [ "$response" -ne 200 ]; then
  echo "Error: Failed to send message. HTTP status code: $response"
  exit 1
fi

echo "Notification sent successfully"
