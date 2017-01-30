## Install & Load packages
install.packages('reshape')
library(reshape)

install.packages('dplyr')
library(dplyr)


## Download ZIP
filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



## read all the data into R
train_data  <- read.table('UCI HAR Dataset/train/X_train.txt')
train_labels <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
train <- cbind(train_subject, train_labels, train_data)

test_data    <- read.table('UCI HAR Dataset/test/X_test.txt')
test_labels  <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
test <- cbind(test_subject, test_labels, test_data)

Activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
features <- read.table('UCI HAR Dataset/features.txt')

##Merge all the data togheter and clearify the specified id's
data <- rbind(train,test)
names(data)[1] <- 'subject_id'
names(data)[2] <- 'label_id'
columnames <- features[,2]
colnames(data)[3:563] <- as.character(columnames)



##Extracts only the measurements on the mean and standard deviation for each measurement.

colnumbers <- grep("-[Ss][Tt][Dd]|-[Mm][Ee][Aa][Nn]|_id",colnames(data))
Selected_data <- data[,colnumbers]

##Uses descriptive activity names to name the activities in the data set
merged <- merge(Selected_data,Activity_labels,by.x ='label_id' ,by.y ='V1' ,all=TRUE)
colnames(merged)[82] <- 'Activity'

##output
melted <- melt(merged, id=c('Activity','subject_id'))
output <- dcast(melted, Activity +subject_id ~ variable, mean)


write.table(output, "output.txt", row.names = FALSE, quote = FALSE)
