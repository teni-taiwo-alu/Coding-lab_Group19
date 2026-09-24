# Hospital Log Management System

This system is meant to secure, analyze and archive simulated hospital device data such as heart rate, temperature, and water usage which is produced by the **hospital_system.py** file.

## Overview 
**hospital_system.py** runs in the background continuously appending sensor readings to log files in the **active_logs/**. The three scripts in turn manage that data. 

## Script uses
1. **hospital_admin.sh** : sets up required directories and locks down permissions on the **active_logs/**.
2. **hospital_analysis.sh** : scans live data in the **active_logs** directory for critical alerts and reports water usage (must run before archiving) 
3. **hospital_archive.sh** : rotates logs out of **active_logs/** into **archived_logs/** with a timestamp then recreates empty logs so the python engine continues writing. 

## Directory Structure 
Coding-lab_Group19
├── README.md
├── hospital_admin.sh
├── hospital_analysis.sh
├── hospital_archive.sh
└── hospital_system.py 
