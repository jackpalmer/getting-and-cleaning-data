#Getting and Cleaning Data Course Project

## Project Description

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run analysis

1. Download the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data in the same directory as ```run_analysis.R```
3. Ensure the working directory is set to the folder containing the script and data using ```getwd()```
4. Run ```run_analysis.R```
5. This will generate two datasets ```tidy_data.csv``` and ```tidy_data_averages.csv```