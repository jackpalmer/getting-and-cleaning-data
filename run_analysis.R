# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Ingest activity label and feature information
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Ingest the training and test set, bind together, and add column names.
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
x <- rbind(x_train, x_test)
colnames(x) <- t(features$V2)

# Drop columns that do not contain standard deviation or mean data
criteria <- c("std","mean")
z <- x[,grepl(paste(criteria, collapse = "|"),names(x))]

# Ingest training and test labels, combine, and merge with activity label descriptors. 
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
y <- rbind(y_train, y_test)
y <- merge(y, activity_labels, by.x = c("V1"),by.y = c("V1"))

# Ingest training and test subject data, combine, and merge with the activity data.
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
y <- cbind(y, subject)

# Clean up column naming for data set.
colnames(y) <- c("Activity_ID","Activity","Subject")

#Combine data set with labels
tidy_data <- cbind(y,z)

#Average tidy data set 
tidy_data_averages <- aggregate(tidy_data[,4:dim(tidy_data)[2]], by = list(tidy_data$Activity_ID,tidy_data$Activity,tidy_data$Subject),FUN = "mean")

#Clean column names and write to file
colnames(tidy_data_averages)[colnames(tidy_data_averages) == 'Group.1'] <- 'Activity_ID'
colnames(tidy_data_averages)[colnames(tidy_data_averages) == 'Group.2'] <- 'Activity'
colnames(tidy_data_averages)[colnames(tidy_data_averages) == 'Group.3'] <- 'Subject'
write.table(tidy_data_averages, file = "tidy_data.txt", row.names = FALSE)
