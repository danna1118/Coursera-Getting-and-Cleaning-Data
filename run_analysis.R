fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip"

# Unzip dataSet to /data directory
if(!file.exists("UCI HAR Dataset")){unzip("./data/getting_dataset.zip")})
setwd("C:/Users/Desktop/R programming/UCI HAR Dataset")
# Reading trainings tables:
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

## Reading feature vector:
features <- read.table('features.txt')

##load activity labels
activityLabels = read.table('activity_labels.txt')

## assigning columns
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')
##merge
mergeTrain <- cbind(y_train, subject_train, x_train)
mergeTest <- cbind(y_test, subject_test, x_test)
mergeAll <- rbind(mrg_train, mrg_test)

colNames <- colnames(mergeAll)

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

setForMeanAndStd <- mergeAll[ , mean_and_std == TRUE]

setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

write.table(TidySet, "TidySet.txt", row.name=FALSE)
