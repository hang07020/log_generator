import time
from datetime import datetime

counter = 1  # Initialize the counter

# Generate the log filename dynamically based on the current date
log_filename = f"testlog_{datetime.now().strftime('%Y%m%d')}.log"

while True:
    with open(log_filename, "a") as log_file:
        log_entry = f"{counter:03d} test {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        log_file.write(log_entry)
    
    counter += 1  # Increment the counter
    time.sleep(5)  # Wait for 5 seconds
