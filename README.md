# Log Generator Scripts

A collection of simple **Bash** and **Python** scripts for generating test logs.  
Each script writes timestamped log entries every 5 seconds, with optional **gzip rotation** after a set number of entries.  

This project is useful for testing SIEM ingestion, log parsers, and monitoring setups.  

---

## Features
- Generate test logs with incrementing counters and timestamps  
- Available in both **Bash** and **Python** versions  
- Two modes:
  - **Basic** → continuously append to a `.log` file  
  - **Gzip rotation** → after every 3 entries, compress logs into a `.gz` file  

---

## Project Structure
```
log-generator/
├── log_generator.sh        # Bash: writes logs continuously to testlog_YYYYMMDD.log
├── log_generator_gz.sh     # Bash: writes logs and compresses every 3 entries
├── increment_logger.py     # Python: writes logs continuously to testlog_YYYYMMDD.log
├── increment_logger_gz.py  # Python: writes logs and compresses every 3 entries
```

---

## Requirements
- **Bash version**: No dependencies (uses `date`, `printf`, `logger`/`echo`, `gzip`)  
- **Python version**: Python 3.x (uses `datetime`, `gzip`, `shutil`, `time`)  

---

## Usage

### Bash: Basic log generator
```bash
chmod +x log_generator.sh
./log_generator.sh
```
Output file example:  
```
testlog_20250901.log
001 test 2025-09-01 12:00:00
002 test 2025-09-01 12:00:05
...
```

---

### Bash: With gzip rotation
```bash
chmod +x log_generator_gz.sh
./log_generator_gz.sh
```
Output file examples:  
```
testlog_20250901.log          # main log file
testlog_20250901_120005.log.gz # compressed after 3 entries
```

---

### Python: Basic log generator
```bash
python3 increment_logger.py
```

### Python: With gzip rotation
```bash
python3 increment_logger_gz.py
```
