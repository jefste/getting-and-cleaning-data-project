# Code Book 
------
## Overview
 This code book describes the data found in the UCI HAR Dataset and the processes it underwent to become a tidy dataset that is stored in the file tidy_data_mean_and_std.txt.
### Structure of the Code book
 1. How was the data obtained
 2. Variable names
 3. How the data was processed

## 1. How the data was obtained 
Since the original README.txt contains thorough explanation of how the data was obtained, part of the file is excerpted below.

### Excerpt from the original README.txt
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data.
 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and
 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
 
For each record it is provided:
======================================
 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.



## 2. Variable names
In the tidy dataset, of the 561 features collected, only 79 features are kept that that are named mean or std as the instructions of the assignment state
that we are to keep only mean and standard deviation features.

As the features_info.txt gives a thorough explanation of the features, part of the file is excerpted here.

### Excerpt from features_info.txt
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


## 3. How the data was processed
This gives a detailed account of how the data was processed in R.

### Loading data into R
 - Read the data in for the test data, including the activity labels and user ID.
 - Read the data in for the training data, including the activity labels and user ID.
 - Read in activity labels to replace activity ID with activity names.
 - Read in the variable names to name all of the columns.

### Combining the data and laveling the 
 - Bind the columns of user ID, activity ID and data for each of the training and test data sets.
 - Rename the columns in the test and training data sets.  
 - Bind the test and training sets together and set as all.Data. 

### Replacing activity labels with activity names
 - Merge the activity labels with the all.Data set to add the activity.name to eachrow. 

### Subsetting data for mean and standard deviation variables 
 - Search for variables that contain 'std' and 'mean' and store the indices.
 - Create new dataset that contains only the columns that have user ID, activity name and 'std' or 'mean' in the name. 

### Grouping data and returning the mean of each activity for each user
 - Create a tidy data set by grouping the data by user and activity then use summarise each to take the mean.

### Saving data as a text file
 - Write out the tidy data set to a txt file labeled tidy_data_mean_and_std.txt 
