#!/bin/bash

   LOGFILE=$1

   # Validation
   if [ ! -f "$LOGFILE" ]; then
       echo "Error: File not found"
       exit 1
   fi

   # Total requests
   echo "=== Log Analysis Report ==="
   echo "Total requests: $(wc -l < $LOGFILE)"

   # Failed logins by IP
   echo -e "\n=== Failed Logins by IP ==="
   grep 401 "$LOGFILE" | awk '{print $1}' | sort | uniq -c | sort -rn

   # Suspicious IPs (you fill this in)
   echo -e "\n=== Suspicious Logins by IP ==="	
   grep 401 "$LOGFILE" | awk '{print $1}' | sort | uniq -c | awk '$1 >= 3 {print $2}'

   # DELETE attempts (you fill this in)
   echo -e "\n=== Delete Attemps by IP ==="
   grep "DELETE" "$LOGFILE" | awk '{print $1 $4}'
