#!/bin/bash

# Check if the user provided a file as an argument
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <filename> <domain>"
  exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi
mkdir contents
# Read the file line by line and process each line
while IFS= read -r line; do
  # Use the line as a variable (you can perform any operations on the line here)
  current_line="$line"
  wget -P ./contents --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8" \
     --header="Accept-Encoding: gzip, deflate, br" \
     --header="Accept-Language: en-US,en;q=0.5" \
     --header="Connection: keep-alive" \
     --header="DNT: 1" \
     --header="Host: $2" \
     --header="Sec-Fetch-Dest: document" \
     --header="Sec-Fetch-Mode: navigate" \
     --header="Sec-Fetch-Site: none" \
     --header="Sec-Fetch-User: ?1" \
     --header="Upgrade-Insecure-Requests: 1" \
     --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0" \
      "$current_line"
      
done < "$filename"

