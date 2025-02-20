#!/bin/bash

# Submission Reminder App Startup Script
echo "Starting Submission Reminder Application..."
echo "=========================================="

# Check if all required components exist
if [ ! -f "./app/reminder.sh" ]; then
    echo "Error: reminder.sh not found in app directory!"
    exit 1
fi

if [ ! -f "./modules/functions.sh" ]; then
    echo "Error: functions.sh not found in modules directory!"
    exit 1
fi

if [ ! -f "./config/config.env" ]; then
    echo "Error: config.env not found in config directory!"
    exit 1
fi

if [ ! -f "./assets/submissions.txt" ]; then
    echo "Error: submissions.txt not found in assets directory!"
    exit 1
fi

# Execute the reminder application
echo "All components verified. Launching application..."
echo ""
cd app && ./reminder.sh

exit 0
