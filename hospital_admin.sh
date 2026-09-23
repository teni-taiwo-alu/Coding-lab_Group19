#!/bin/bash
# hospital_admin.sh — KNH environment setup and permissions
# Members 1 (Architect), 2 (Security Lead), 3 (Orchestrator)
 
# ---------- Member 1: The Architect ----------
initialize_system() {
    for dir in active_logs archived_logs reports; do
        if [ -d "$dir" ]; then
            echo "$dir directory already exists."
        else
            echo "Creating $dir directory..."
            mkdir -p "$dir"
        fi
    done
}
 
# ---------- Member 2: The Security Lead ----------
# member 2 should work on the secure_data function below
secure_data() {
chmod 700 active_logs
ls -l active_logs

}


initialize_system
secure_data

echo "System Environment Secured"
date

