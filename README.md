# Cleaning
Getting and cleaning data cours project

The script:
- downloading the training dataset
- unziping it to the working directory
- loading data from X_train and X_test files
- labeling columns based on features.txt
- appending rows with subject nr and activity code based on subject_test/training.txt and y_test/training.txt (columns named: subject and activity)
- merging X_train and X_test into "dataset" (X_train and X_test being removed to save resources)
- replacing activity code with activity labels based on activity_labels.txt (temporary objects removed to save resources)
- subseting columns of interest (name contains "meaan()" or "std()"), "subject" and "activity" columns included, temporary objects removed
- creating a tidy dataset:
    - grouping dataset by subject or activity and summarizing to get means for all columns (sub-when grouped by subject and act-when grouped by ativity), "dataset" is removed
    - first column (subject/activity) of sub/act is used as a label for rows
    - merging sub and act to tidy_dataset, sub and act removed
- saving tidy dataset in working directory
- cleanig the workspace
