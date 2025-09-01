import time
import os
import gzip
import shutil
from datetime import datetime

log_filename = f"testlog_{datetime.now().strftime('%Y%m%d')}.log"
counter = 1
log_count = 0

while True:
    # Write log entry
    with open(log_filename, "a") as log_file:
        log_entry = f"{counter:03d} test {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        log_file.write(log_entry)

    counter += 1
    log_count += 1

    # Every 3 entries, gzip the log file
    if log_count >= 3:
        gz_filename = f"testlog_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log.gz"

        with open(log_filename, 'rb') as f_in:
            with gzip.open(gz_filename, 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)

        log_count = 0  # Reset the count

    time.sleep(5)
