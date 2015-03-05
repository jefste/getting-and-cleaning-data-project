#load the test data
testData<-read.table('UCI HAR Dataset//test/X_test.txt')
#load the labels for the test data
testData.labels<-read.table('UCI HAR Dataset//test/y_test.txt')
#load the users for the test data
testData.user<-read.table('UCI HAR Dataset//test/subject_test.txt')

#load the training data
trainData<-read.table('UCI HAR Dataset//train//X_train.txt')
#load the training data labels
trainData.labels<-read.table('UCI HAR Dataset//train//y_train.txt')
#load the training data users
trainData.user<-read.table('UCI HAR Dataset//train//subject_train.txt')

#load the labels for the activities
## use this to map the activity number to an activity name  
activity.labels<-read.table('UCI HAR Dataset//activity_labels.txt')


#loads all of the names of the variables in the train and test data sets
#use this to name the columns
variable.names<-read.table('UCI HAR Dataset//features.txt')

#create readable labels for the measured data
# join 'user' and 'activity' with the second column of variable.names
# note that variable.names is also converted to a character (it was a factor)
labels.meas<-c('user','activity',as.character(variable.names[,2]))

#bind the data together to have the training users, activities,
# and all measured variables
trainData<-cbind(trainData.user,trainData.labels,trainData)

#bind the data together to have the test users, activities,
# and all measured variables combined into one data set
testData<-cbind(testData.user,testData.labels,testData)

#label the columns in test and train data using the previously defined labels
colnames(testData)<-labels.meas
colnames(trainData)<-labels.meas
## this completes the fourth objective

#bind the test and training data together by rows
all.Data<-rbind(testData,trainData)
## this completes the first objective

#for the activity labels, name the columns  
colnames(activity.labels)<-c('activity.ID','activity.name')

# in the all.Data data frame, replace activity number with the activity label 
all.Data[,2]<-sapply(all.Data[,2],function(x) activity.labels[x,2])
## this completes the third objective

#use grep to search for labels with 'std' and 'mean'
## keep the indices of appropriately named columns
std.labels.index<-grep('std()',labels.meas)
mean.labels.index<-grep('mean()',labels.meas)

#create a master list of indices (all.ind) to read for columns that report 
#either a mean or a standard deviation
###add user id and activity name by adding indices 1 and 2
all.ind<-sort(c(1,2,mean.labels.index,std.labels.index))

#subsets all data to only include columns that have mean or standard deviation
# in the name
all.Data.Mean.Std<-all.Data[,all.ind]
## this completes the second objective 


#load dplyr to manipulate the data set
library(dplyr)
#create a tidy data set from the already trimmed data set that has mean or std
# in the name of the variable
tidy.Data<-all.Data.Mean.Std%>%
    #group first by user, then by activity
    group_by(user,activity) %>% 
    #return the mean for each variable that has either mean or std in the name 
    summarise_each(funs(mean))

#write data out to txt file
write.table(tidy.Data,file='all_data_mean_and_std.txt',row.name=FALSE)
#this completes the fifth objective

