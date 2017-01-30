# Getting-and-Cleaning-Data-Course-Project
This repository includes the files for the Peer-graded Assignment: Getting and Cleaning Data Course Project

CodeBook.md contains a description of the data set, the variables meanings and possible values. run_analysis.R contains the steps necessary to read the raw data set, process it according to the assignment instructions, and obtain the tidy data set. tidy_dataset.txt contains the tidy data set.

Unzip that downloaded raw data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in your working directory and make sure to set the working directory for RStudio also. Run the run_analysis.R in your working directory. It will:

read the training and testing data sets and their labels, activities descriptions, subjects file
merge the training and test data sets
select only mean and std columns
rename columns
group and join the data with activities and subjects
tidy the data set by creating more columns with values described in the code book. It's a tall tidy data set.
