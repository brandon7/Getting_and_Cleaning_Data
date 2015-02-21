#Code book
##The data
The data was collected from Samsung Galaxy S smartphone accelerometers and gyroscope. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used in this project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##The variables
*Subject: The subject ID identifying one of the thirty volunteers.
*Activity: One of the six activities performed by the subject. 
*The rest of the variables are from the accelerometer and gyroscope 3-axial raw signals.More information can be found here:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

##Procedure
The the `run_analysis.r` script follows the following procedure:
* The training and test sets are merged
* The mean and standard deviation measurements are extracted for each measurement
* Descriptive activity names are assigned to  the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, an independent tidy data set with the average of each variable for each activity and each subject

