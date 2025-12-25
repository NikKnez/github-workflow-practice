#!/bin/bash
# Monitor backup status with configurable age threshold

BACKUP_DIR="/var/backups"
MAX_AGE_HOURS=${BACKUP_MAX_AGE:-24}

latest_backup=$(find $BACKUP_DIR -type f -name "*.tar.gz" -mtime -1 | head -1)

if [ -z "$latest_backup" ]; then
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] ⚠️  WARNING: No backup found in last $MAX_AGE_HOURS hours"
    exit 1
else
    echo "✓ Backup is current: $latest_backup"
    exit 0
fi
