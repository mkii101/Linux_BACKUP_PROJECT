#!/bin/bash
echo " === Script Started at $(date) ==== "

#Variables Definitions
mkdir -p "~/temp" "~/backups"



BACKUP_SCR="~/temp"
BACKUP_DST="~/backups"
BACKUP_DATE=$(date  "+%Y%m%d%H%M%S")
LOG_DIR="~/log"
LOG_FILE="$LOG_DIR/BACKUP_$BACKUPDATE.log"
#MAX_LOGS= 5
#MAX_BACKUP= 7
EMAIL_TO="DevOps@example.com"
HOSTNAME="www.RouteAcademy.com"

BACKUP_FILENAME="Backup_$BACKUP_DATE.tar.gz"

mkdir -p "$LOG_DIR"
mkdir -p "$BACKUP_DST/$BACKUP_DATE"

# Achieve backup file

tar -czf "$BACKUP_FILENAME" "$BACKUP_SCR"

# verify

if [ $? -eq 0 ]; then
        echo "Backup Successful: $BACKUP_FILENAME"
else
        echo "Backup failed on $HOSTNAME at $BACKUP_DATE" | mail -s "BACKUP FAILURE ON $HOSTNAME" $EMAIL_TO

fi
