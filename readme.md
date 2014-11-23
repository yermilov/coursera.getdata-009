Analysys of data collected from the accelerometers from the Samsung Galaxy S smartphone
=======================================================================================

### Data

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data description

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Steps to reproduce analysys

* Download data
* Unpack archive
* Place run_analysis.R file in the same folder with 'UCI HAR Dataset' folder.
* Run run_analysis() function.

### Analysys description
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Return tidy data set with the average of each variable for each activity and each subject.
