# CleaningData
This repo contains run_analysis.R, which takes wearable data copied locally from here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and produces a tidy data set with the test and training data combined. It creates descriptive column names, replaces labels for activity ids and associates the right subject with the right data. Then, it produces a second tidy data set that contains the mean over each subject for all the values.

To use this function the files in the above zip must be stored locally in the working directory with the same folder structure defined in the zip.
