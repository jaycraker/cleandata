library(plyr)
library(dplyr)
## read all data sets-  information only 
<<<<<<< HEAD

## to run the program change Insert your path below dir <-"xxxx"
dir <- "H:/coursera/UCI HAR Dataset"
=======
#dir <- "E:/coursera/cleandata/UCI HAR Dataset" 
dir <- "E:/coursera/UCI HAR Dataset"
>>>>>>> ec2a90aac6123375dd606e64dfbc2ec557060742

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
subject_tt <- rbind(subject_train, subject_test) 

## Step 2.Uses descriptive activity names to name the activities in the data set

names(x_tt) <- features[ ,2]

## Step 3 Extract the mean and standard deviation for each measurement 

x_tt_mn_std <- grep("(mean|std)\\(\\)", names(x_tt))
select_mn_std <- x_tt[, x_tt_mn_std]

##Step 4 appropriatly name data set with descriptive variable names

y_tt[, 1] <- activities[y_tt[, 1], 2]
names(y_tt) <- "activity"
names(subject_tt) <- "subject" 

## Step 5 from step 4 create a data set with the average of each variable for each activity and each subject.

combined_data <- cbind(y_tt, select_mn_std , subject_tt)
avg_data <- ddply(combined_data, c("subject","activity"), numcolwise(mean))
write.table(avg_data, "E:/averages_data.txt", row.name=FALSE) 
View(avg_data)