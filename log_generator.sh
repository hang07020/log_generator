#!/bin/bash

# Generate log filename with current date (YYYYMMDD)
log_filename="testlog_$(date +%Y%m%d).log"

# Initialize the counter
count=1

# Infinite loop
while true; do
    # Format the number as 3 digits with leading zeros
    formatted_count=$(printf "%03d" "$count")

    # Write to log file
    echo "${formatted_count} test $(date '+%Y-%m-%d %H:%M:%S')" >> "$log_filename"

    # Wait for 5 seconds
    sleep 5

    # Increment the counter
    ((count++))
done
