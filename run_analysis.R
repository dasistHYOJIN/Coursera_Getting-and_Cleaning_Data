
# Load libraries
library(dplyr)

# Set directory
getwd()
setwd("C:\\Users\\Hyo-Jin\\Documents\\Getting and Cleaning Data")

# Load Data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", fill = TRUE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", fill = TRUE)
training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", fill = TRUE)
training_sets <- read.table("./UCI HAR Dataset/train/X_train.txt", fill = TRUE)
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", fill = TRUE)
test_sets <- read.table("./UCI HAR Dataset/test/X_test.txt", fill = TRUE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", fill = TRUE)
features <- read.table("./UCI HAR Dataset/features.txt", fill = TRUE)

names(training_labels)[1] <- "Label"
names(test_labels)[1] <- "Label"
names(subject_train)[1] <- "Subject"
names(subject_test)[1] <- "Subject"
names(activity_labels) <- c("Label", "Activity")



### 1. Merges the training and the test sets to create one data set. ###
# Bind all together
dataSet <- rbind(training_sets, test_sets)
dim(dataSet)
names(dataSet)


### 2. Extracts only the measurements on the mean and standard deviation for each measurement. ###
dataRow <- grep("mean()|std()", features[, 2]) 
extractedSet <- dataSet[,dataRow]
dim(extractedSet)
names(extractedSet)


### 4. Appropriately labels the data set with descriptive variable names. ###
names(extractedSet) <- features[,2][dataRow]
names(extractedSet)
# bind Labels data to Sets data
dataLabels <- rbind(training_labels, test_labels)
dataSubjects <- rbind(subject_train, subject_test)
bindedSet <- cbind(dataSubjects, dataLabels, extractedSet)


### 3. Uses descriptive activity names to name the activities in the data set ###
bindedSet$Label <- sapply(bindedSet$Label, function(x) { activity_labels[[2]][x] })
namedSet <- bindedSet
names(namedSet)


### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ###
secondSet <- namedSet %>% 
  group_by(Subject, Label) %>%
  summarise_all(mean)

write.table(secondSet, "tidy_data.txt")
