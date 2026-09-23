#!/bin/bash

function process_vitals {
	grep -h "CRITICAL"  active_logs/heart_rate_log.log active_logs/temperature_log.log active_logs/water_usage_log.log \ 
	| awk '{print $1, $2, $4}'> reports/critical_alerts.txt
}

process_vitals

function water_audit {
    avg=$(grep -h "ICU_WATER_RESERVE" active_logs/water_usage_log.log \
        | awk '{sum += $3; count++} END {if (count > 0) print sum/count; >
    printf "=== ICU Water Reserve Audit ===\n"
    printf "Average usage: %.2f litres\n" "$avg"
}
water_audit

