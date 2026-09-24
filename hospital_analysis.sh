#!/bin/bash

#Searches log files for CRITICAL and extracts the first second and fourth fields into critical_alerts.txt file
function process_vitals {
	grep -h "CRITICAL"  active_logs/heart_rate_log.log active_logs/temperature_log.log active_logs/water_usage_log.log \
	| awk '{print $1, $2, $4}'> reports/critical_alerts.txt
}

process_vitals

#Searches water usage log for ICU WATER RESERVE and uses awk to calculate the average of the usage values
function water_audit {
    avg=$(grep -h "ICU_WATER_RESERVE" active_logs/water_usage_log.log \
	    | awk -F' *\\| *' '{sum += $3; count++} END {if (count > 0) print sum/count; else print 0}')
    printf "=== ICU Water Reserve Audit ===\n"
    printf "Average usage: %.2f litres\n" "$avg"
}
water_audit

