# getting-and-cleaning-data

Overview
--------
This repo contains an R script for extracting, cleaning and thence calculating the means and standard deviations of various gyroscopic measurements from a [smartphone data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).

Files
-----
### CodeBook.md
A code book explaining the results and variables presented in the data set
### run_analysis.R
The R script used to construct and tidy this data set from its component parts. As a first step to prepare the data, it does the following:
* Reads in the flat data measurement and lookup files from local copies (assumed to have been downloaded and unzipped to the working directory):
    * ./train/X_train.txt
    * ./test/X_test.txt
    * ./train/Y_train.txt
    * ./test/Y_test.txt
    * ./train/subject_train.txt
    * ./test/subject_test.txt
    * ./activity_labels.txt
    * ./features.txt
* Enriches with column names
* Combines the 'training' and 'test' data sets
* Replaces 'Activity' indices wih descriptive names
* Subsets the variables to only include mean and standard deviation measurements

It then creates a tidy data set aggregating measurement means by Subject and Activity.
