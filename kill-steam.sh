#!/bin/bash

# Script to kill all Steam processes until they are gone

echo "Checking for Steam processes..."

# Check if Steam is running
if ! pgrep -x steam > /dev/null; then
    echo "No Steam processes are currently running."
    exit 0
fi

echo "Stopping all Steam processes..."

# Loop until no Steam processes are found
while pgrep -x steam > /dev/null; do
    pkill -x steam
    echo "Steam processes terminated. Checking again..."
    sleep 1 # Wait 1 second before re-checking
done

echo "All Steam processes have been successfully stopped."

