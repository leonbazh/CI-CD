#!/bin/bash

TELEGRAM_BOT_TOKEN=6871042153:AAETVnXhOOlWpCs4ViIuUD6cXUHVSrQNgcU
TELEGRAM_USER_ID=833274610
TIME=15
CI_PROJECT_NAME=DO6_CICD-1

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0Astage:+$CI_JOB_STAGE%0Astatus:+$CI_JOB_STATUS%0A"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null

