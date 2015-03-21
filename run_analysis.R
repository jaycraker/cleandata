# Step 1 
# Read all data sets to create  one data set 
############################################################################### 
library(plyr)
library(dplyr)
##Step 0 read all data sets 
dir <- "C:/coursera/cleandata/UCI HAR Dataset" 
x_train <- read.table(paste(dir,"/train/X_train.txt", sep ="/" ))
y_train <- read.table(paste(dir, "/train/y_train.txt", sep ="/")) 
subject_train <- read.table(paste(dir, "/train/subject_train.txt", sep = "/")) 

x_test <- read.table(paste(dir, "/test/X_test.txt", sep = "/")) 
y_test <- read.table(paste(dir, "/test/y_test.txt", sep = "/")) 
subject_test <- read.table(paste(dir, "/test/subject_test.txt", sep = "/"))
features <- read.table(paste(dir,"features.txt", sep = "/"))
activities <- read.table(paste(dir, "activity_labels.txt", sep = "/"))                   
## Step 1 Merge Training and testing data sets
x_tt <- rbind(x_train, x_test)
y_tt <- rbind(y_train, y_test)

# Step 3.Uses descriptive activity names to name the activities in the data set
subject_tt <- rbind(subject_train, subject_test) 
names(x_tt) <- features[ ,2]

## Step 2 Extract the mean and standard deviation for each measurement 
x_tt_mn_std <- grep("(mean|std)\\(\\)", names(x_tt))
select_mn_std <- x_tt[, x_tt_mn_std]
y_tt[, 1] <- activities[y_tt[, 1], 2]
names(y_tt) <- "activity"

# Step 3.Uses descriptive activity names to name the activities in the data set
subject_tt <- rbind(subject_train, subject_test) 
names(x_tt) <- features[ ,2]

#Step 4 appropriatly name data set with discriptiv3e d
names(subject_tt) <- "subject" 
combined_data <- cbind(y_tt, select_mn_std , subject_tt)

## Step 5 from step 4 create a data set with the average of each variable for each activity and each subject.
avg_data <- ddply(combined_data, c("subject","activity"), numcolwise(mean))
write.table(avg_data, "E:/averages_data.txt", row.name=FALSE) 
View(avg_data)