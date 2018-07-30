
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
trainings <- cbind(subject_train, training_labels, training_sets)
tests <- cbind(subject_test, test_labels, test_sets)
# Bind all together
dataSet <- rbind(trainings, tests)
dim(dataSet)
names(dataSet)


### 2. Extracts only the measurements on the mean and standard deviation for each measurement. ###
data <- grep("mean()|std()", features[, 2]) 
extractedSet <- dataSet[,data]
dim(extractedSet)
names(extractedSet)


### 3. Uses descriptive activity names to name the activities in the data set ###
activities <- factor(extractedSet$Label)
levels(activities) <- activity_labels[,2]
extractedSet$Label <- activities

# or
name_activity <- function(l) {
  switch (l,
    "1" = return("WALKING"),
    "2" = return("WALKING_UPSTAIRS"),
    "3" = return("WALKING_DOWNSTAIRS"),
    "4" = return("SITTING"),
    "5" = return("STANDING"),
    "6" = return("LAYING")
  )
}
extractedSet$Label <- sapply(extractedSet$Label, name_activity)


# 4. Appropriately labels the data set with descriptive variable names.



# 5. From the data set in step 4, creates a second, 
 # independent tidy data set with the average of each variable for each activity and each subject.



write.table(secondDataSet, "tidy_data.txt")
