#!/bin/bash

# get pushover creds from zed
. /etc/zfs/zed.d/zed.rc

# Define your Pushover User and API Token
PUSHOVER_USER=$ZED_PUSHOVER_USER
PUSHOVER_TOKEN=$ZED_PUSHOVER_TOKEN

# Define the temperature threshold
TEMP_THRESHOLD=46

# Check each drive's temperature
for drive in /dev/sd?; do
    temp=$(smartctl -A "$drive" | awk '/Temperature_Celsius/ {print $10}')
    
    if [ -n "$temp" ] && [ "$temp" -gt "$TEMP_THRESHOLD" ]; then
        # Send Pushover notification
        curl -s \
            --form-string "token=$PUSHOVER_TOKEN" \
            --form-string "user=$PUSHOVER_USER" \
            --form-string "title=Drive Temperature Alert" \
            --form-string "message=Drive $drive is at $temp C, exceeding the threshold of $TEMP_THRESHOLD C. Shutting down!" \
            https://api.pushover.net/1/messages.json
        echo "message=Drive $drive is at $temp C, exceeding the threshold of $TEMP_THRESHOLD C. Shutting down!" 
	shutdown -h now
    fi
done

