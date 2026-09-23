#!/bin/bash

function process_vitals {
	grep -h "CRITICAL"  active_logs/heart_rate_log.log active_logs/temperature_log.log active_logs/water_usage_log.log \ 
	| awk '{print $1, $2, $4}'> reports/critical_alerts.txt
}

process_vitals


