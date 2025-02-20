# Submission Reminder Application

This application checks student assignment submissions and sends reminders to those who haven't submitted their work yet.

## Directory Structure

```
submission_reminder_{yourName}/
|── app/
|   └── reminder.sh
|── modules/
|   └── functions.sh
|── assets/
|   └── submissions.txt
|── config/
|   └── config.env
└── startup.sh
```

## Installation

1. Clone this repository:
   ``
   git clone https://github.com/yourusername/submission_reminder_app_yourgithubusername.git
   cd submission_reminder_app_yourgithubusername
   ```

2. Run the environment setup script:
   ``
   chmod +x create_environment.sh
   ./create_environment.sh
   ```

3. When prompted, enter your name. The script will create a directory called `submission_reminder_{yourName}` with all necessary files and subdirectories.

## Running the Application

1. Navigate to the created directory:
   ```
   cd submission_reminder_{yourName}
   ```

2. Execute the startup script:
   ```
   ./startup.sh
   ```

## Application Components

- **reminder.sh**: Main application script that processes student submissions and displays reminders
- **functions.sh**: Contains the `check_submissions` function to process submission data
- **config.env**: Configuration file with assignment name and days remaining
- **submissions.txt**: CSV file containing student submission records
- **startup.sh**: Script to launch the application and verify all components exist

## Submission Format

The `submissions.txt` file uses the following CSV format:
```
student, assignment, submission status
```

Example:
```
Chinemerem, Shell Navigation, not submitted
```

## Configuration

You can modify the assignment being tracked and the days remaining by editing the values in the `config.env` file.

## How It Works

The application:
1. Reads the submission status from the submissions.txt file
2. Checks for students who haven't submitted the specified assignment
3. Outputs reminder messages for those students
