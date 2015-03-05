# Overview of run_analysis.R script
The run_analysis.R completes the 5 objectives as outlined in the assignment and the objectives are labeled as (1) to (5) in the text below. 
The script merges the training and test data sets (1), extracts measurements on mean and standard deviation measurements (2), and labels the activities (3)
and variables with descriptvie names (4).  
From this data set, a tidy data set is created where the average of each variable for each activity and each user is saved as a text file (5).

A more detailed overview of the data can be found in the included CodeBook.md file.

## Details of Script
This describes the details of the script and how they achieve the 5 requirements of the assignment.

### Loading data into R
 - Read the data in for the test data, including the activity labels and user ID.
 - Read the data in for the training data, including the activity labels and user ID.
 - Read in activity labels to replace activity ID with activity names.
 - Read in the variable names to name all of the columns.

### Combining the data and labeling the variables 
 - Bind the columns of user ID, activity ID and data for each of the training and test data sets.
 - Rename the columns in the test and training data sets.  (Completes objective 4)
 - Bind the test and training sets together and set as all.Data. (Completes objective 1)

### Replacing activity labels with activity names
 - Merge the activity labels with the all.Data set to add the activity.name to eachrow. (Completes objective 3)

### Subsetting data for mean and standard deviation variables 
 - Search for variables that contain 'std' and 'mean' and store the indices.
 - Create new dataset that contains only the columns that have user ID, activity name and 'std' or 'mean' in the name. (Completes objective 2)

### Grouping data and returning the mean of each activity for each user
 - Create a tidy data set by grouping the data by user and activity then use summarise each to take the mean.

### Saving data as a text file
 - Write out the tidy data set to a txt file labeled tidy_data_mean_and_std.txt (Completes objective 5)
