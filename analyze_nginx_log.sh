#!/bin/bash

LOGFILE="$1"

if [[ ! -f "$LOGFILE" ]]; then
    echo "Usage: $0 <nginx_access_log_file>"
    exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 most requested paths:"
awk -F\" '{print $2}' "$LOGFILE" | awk '{print $2}' | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 response status codes:"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
