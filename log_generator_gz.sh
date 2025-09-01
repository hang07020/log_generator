#!/bin/bash

# Generate base log filename with current date (YYYYMMDD)
log_filename="testlog_$(date +%Y%m%d).log"

# Initialize counters
count=1
log_count=0

# Infinite loop
while true; do
    # Format the number as 3 digits with leading zeros
    formatted_count=$(printf "%03d" "$count")

    # Write to log file
    echo "${formatted_count} test $(date '+%Y-%m-%d %H:%M:%S')" >> "$log_filename"

    # Increment counters
    ((count++))
    ((log_count++))

    # Every 3 entries, gzip the log file
    if [ "$log_count" -ge 3 ]; then
        gz_filename="testlog_$(date +%Y%m%d_%H%M%S).log.gz"
        gzip -c "$log_filename" > "$gz_filename"
        echo "Rotated and compressed to $gz_filename"

        # Reset the counter for rotation
        log_count=0
    fi

    # Wait for 5 seconds
    sleep 5
done
