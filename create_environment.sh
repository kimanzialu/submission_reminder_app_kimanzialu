#!/bin/bash

# This script creates the directory structure for the submission_reminder app

echo "Welcome to the Submission Reminder App Environment Setup"
echo "========================================================="

# Ask for user's name
read -p "Please enter your name: " username

# Validate input - ensure name is not empty
while [[ -z "$username" ]]; do
    echo "Name cannot be empty."
    read -p "Please enter your name: " username
done

# Create main directory
main_dir="submission_reminder_${username}"
echo "Creating main directory: $main_dir"
mkdir -p $main_dir

# Create subdirectories
echo "Creating application directory structure..."
mkdir -p $main_dir/app
mkdir -p $main_dir/modules
mkdir -p $main_dir/assets
mkdir -p $main_dir/config

# Create reminder.sh in app directory
echo "Creating reminder.sh in app directory..."
cat > $main_dir/app/reminder.sh << 'EOL'
#!/bin/bash

# Source environment variables and helper functions
source ../config/config.env
source ../modules/functions.sh

# Path to the submissions file
submissions_file="../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL
chmod +x $main_dir/app/reminder.sh

# Create functions.sh in modules directory
echo "Creating functions.sh in modules directory..."
cat > $main_dir/modules/functions.sh << 'EOL'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL
chmod +x $main_dir/modules/functions.sh

# Create config.env in config directory
echo "Creating config.env in config directory..."
cat > $main_dir/config/config.env << 'EOL'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create submissions.txt in assets directory
echo "Creating submissions.txt in assets directory with additional records..."
cat > $main_dir/assets/submissions.txt << 'EOL'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John, Shell Navigation, not submitted
Sarah, Shell Navigation, not submitted
Michael, Shell Basics, not submitted
Emma, Shell Navigation, not submitted
Jennifer, Shell Navigation, not submitted
Robert, Git, submitted
David, Git, not submitted
EOL

# Create startup.sh in main directory
echo "Creating startup.sh in main directory..."
cat > $main_dir/startup.sh << 'EOL'
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
EOL
chmod +x $main_dir/startup.sh

echo "========================================================="
echo "Setup completed successfully!"
echo "Your application environment has been created at: $main_dir"
echo ""
echo "To run the application:"
echo "1. Navigate to the directory: cd $main_dir"
echo "2. Execute the startup script: ./startup.sh"
echo "========================================================="
