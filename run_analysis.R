#LOAD PACKAGES

require(plyr)

#STEP ONE
#Merge the training and the test sets to create one data set.
#####################################################################

#Load training data
xTrain <- read.table('train/x_train.txt')
yTrain <- read.table('train/y_train.txt')
subjectTrain <- read.table('train/subject_train.txt')

#Load test data
xTest <- read.table('test/x_test.txt')
yTest <- read.table('test/y_test.txt')
subjectTest <- read.table('test/subject_test.txt')

#Merge x data
xData <- rbind(xTrain,xTest)

#Merge y data
yData <- rbind(yTrain,yTest)
names(yData) <- 'activity'

#Merge subject data
subjectData <- rbind(subjectTrain,subjectTest)
names(subjectData) <- 'subject'

#STEP TWO
#Extract only the measurements on the mean and standard deviation for 
#each measurement. 
#####################################################################

#Load descriptive variable names
features <- read.table('features.txt')

#label the data set with descriptive variable names
colnames(xData) <- as.character(features$V2)

#Index columns with measurements on the mean and standard deviation
colIndex <- grep('mean',colnames(xData))
colIndex <- c(colIndex,grep('std',colnames(xData)))

#Subset data with only mean and std columns
xData <- xData[,colIndex]

#STEP THREE
#Use descriptive activity names to name the activities in the data set 
#####################################################################

#Load activity labels
activityLabels <- read.table('activity_labels.txt')

#label the data set with descriptive activity names
yData$activity <- activityLabels$V2[yData$activity]

#STEP FOUR
#Appropriately label the data set with descriptive variable names. 
#####################################################################

#This was partly done in step two

#Merge all data
allData <- cbind(subjectData,yData,xData)

#STEP FIVE
#creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject.
#####################################################################

#Column means into new data set
tidyData <- ddply(allData,.(subject,activity),colwise(mean))

#write table to file
write.table(tidyData, 'tidyData.txt', row.name=FALSE)
