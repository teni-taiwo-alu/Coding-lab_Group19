#!/bin/bash

ACTIVE_DIR="active_logs"
ARCHIVE_DIR="archived_logs"
TIMESTAMP="$(date + %Y%m%d_%H%M)

mkdir -p "$ARCHIVE_DIR" 

for log_file in "$ACTIVE_DIR"/*.log; do
	[ -e "$log_file" ] || continue

	base_name=$(basename "$log_file" .log)
	archived_name="${ARCHIVE_DIR}/${base_name}_${TIMESTAMP}.log" 

	if [ -e "$archived_name" ]; then
		echo "The $archived_name exists, skipping $log_file" >&2
		continue 
	fi

	mv "$log_file" "$archived_name"

	# recreate empty log so recording continue without interruption
	touch "$log_file" 

	echo "Archived: $log_file -> $archived_name"

done
