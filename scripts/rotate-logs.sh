#!/bin/bash
# Rotate application logs

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
DAYS_TO_KEEP=30

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Find and compress logs older than 1 day
find $LOG_DIR -maxdepth 1 -name "*.log" -mtime +1 -exec gzip {} \;

# Move compressed logs to archive
find $LOG_DIR -maxdepth 1 -name "*.log.gz" -exec mv {} $ARCHIVE_DIR/ \;

# Delete archived logs older than retention period
find $ARCHIVE_DIR -name "*.log.gz" -mtime +$DAYS_TO_KEEP -delete

echo "Log rotation complete"
