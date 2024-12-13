#!/bin/bash

# Script to kill all Steam processes until they are gone

echo "Stopping all Steam processes..."

# Loop until no Steam processes are found
while pgrep -x steam > /dev/null; do
    pkill -x steam
    echo "Steam processes terminated. Checking again..."
    sleep 1 # Wait 1 second before re-checking
done

echo "All Steam processes have been successfully stopped."

