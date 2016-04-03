
run_analysis <- function(x_test, x_train) {  
  #we are going to use data.table...make sure it is loaded
  library(data.table) 
  
  #load data from test files    
  subject_test = read.table("UCI HAR Dataset/test/subject_test.txt") 
#  x_test = read.table("UCI HAR Dataset/test/X_test.txt") 
  y_test = read.table("UCI HAR Dataset/test/Y_test.txt") 
  
  #load data from training files
  subject_train = read.table("UCI HAR Dataset/train/subject_train.txt") 
#  x_train = read.table("UCI HAR Dataset/train/X_train.txt") 
  y_train = read.table("UCI HAR Dataset/train/Y_train.txt") 
  
  #load data from other files 
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel")) 
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel")) 
  
  #only grab the mean and std features
  meanOrStdFeatures <- grep("std\\(|mean\\(", features$featureLabel)

  #bind together subject id test and train data  
  subject <- rbind(subject_test, subject_train) 
  names(subject) <- "subjectid" 
  
  #bind together x test and train data for only the mean and std values
  x <- rbind(x_test, x_train) 
  x <- x[, meanOrStdFeatures] 
  names(x) <- features$featureLabel[meanOrStdFeatures] 
  
  #bind together y test and train data 
  y <- rbind(y_test, y_train) 
  names(y) = "activityId" 
  activity <- merge(y, activities, by="activityId")$activityLabel 
  
  #bind together all the columns 
  tidydata <- cbind(subject, x, activity) 

  
  # create a datatable by subject and activity with mean calculations 
  dataTableTidyData <- data.table(tidydata) 
  calculatedData <- dataTableTidyData[, lapply(.SD, mean), by=c("subjectid", "activity")] 

  calculatedData
}

