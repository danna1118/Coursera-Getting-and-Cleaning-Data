Getting and Cleaning Data Course Project
This code book summarizes the resulting data fields in TidySet.txt.

Description of the DATA
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
(Note the ‘f’ to indicate frequency domain signals).
Description of abbreviations of measurements

leading t or f is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Acc = accelerometer measurement
Gyro = gyroscopic measurements
Jerk = sudden movement acceleration
Mag = magnitude of movement
mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation

Files in folder ‘UCI HAR Dataset’ that will be used are:

SUBJECT FILES
test/subject_test.txt
train/subject_train.txt
ACTIVITY FILES
test/X_test.txt
train/X_train.txt
DATA FILES
test/y_test.txt
train/y_train.txt
features.txt - Names of column variables in the dataTable
activity_labels.txt - Links the class labels with their activity name.

Data processing
1. Downloading and unzipping dataset
2. Merging the training and the test sets to create one data set:
Reading files(using read.table)
Assigning column names (using colnames())
Merging all data in one dataset (using cbind(), rbind())
3. Extracting only the measurements on the mean and standard deviation for each measurement
Reading column names(using colnames())
Create vector for defining ID, mean and standard deviation(using grepl())
Making nessesary subset 
4. Using descriptive activity names to name the activities in the data set
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
Making second tidy data set(using aggregate())
Writing second tidy data set in txt file(using write.table())

