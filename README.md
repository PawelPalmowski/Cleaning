# Cleaning
Getting and cleaning data cours project

This repo contains a script named run_analysis.R, written as a part of Getting and cleaning data cours project.
Its functionality is to:
- download a course dataset (url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- unpack the data
- read the data (from two files)
- merge datasets
- label entries and variables
- create and save a new independent tidy data set with the average of each variable for each activity and each subject.
The output of this script is a file in a working directory called tidy_dataset.txt
