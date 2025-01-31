#!/bin/bash

# Create a directory named "students_directory"
mkdir -p students_directory

# Navigate into the directory
cd students_directory

# Create the files: cohort-1.txt, cohort-2.txt, and cohort-3.txt
touch cohort-1.txt cohort-2.txt cohort-3.txt

# Print a message confirming the creation of the directory and files
echo "Directory 'students_directory' and files 'cohort-1.txt', 'cohort-2.txt', and 'cohort-3.txt' have been created successfully."

# Insert at least 3 names in cohort-1.txt with new lines after each name
echo -e "1. Kenny \n2. Divine \n3. Thierry \n4. Shakira \n5. Chipo \n" > cohort-1.txt

# Insert at least 3 names in cohort-3.txt with new lines after each name
echo -e "1. Yannick \n2. Alice \n3. Mike \n4. Joy \n5. Sam \n" > cohort-3.txt

#searching a student name in file without opening file.
grep 'Kenny' 'cohort-1.txt'

# Use wc to count lines and words in cohort-2.txt
wc cohort-2.txt
