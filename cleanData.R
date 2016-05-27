library(dplyr)
library(data.table)

#Replace with your desired directory
dir<-"C:/users/nathan/desktop/R/Samsung/SamsungData"

#check if desired working directory exists
if(!file.exists(dir)){
        dir.create(dir)
}

#set workind directory
setwd(dir)

#checks if data already pulled from the web
if(!file.exists(paste(dir,"/dataSet.zip", sep=""))){
        #gets data from the web
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="./dataSet.zip")
}

#Check if hte zip file has already been unziped
if(!file.exists("./UCI HAR Dataset")){
        #unzip's zip file
        unzip("./dataSet.zip")
}


### 1.)  Merge the training and the test sets to create one data set.

#Training data into data frames
subject_train=read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train=read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train=read.table("./UCI HAR Dataset/train/Y_train.txt")

#Test data into dat frames
subject_test=read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test=read.table("./UCI HAR Dataset/train/X_test.txt")
Y_test=read.table("./UCI HAR Dataset/test/Y_test.txt")



#Merge the training and test sets
subjectData<-rbind(subject_test,subject_train)
names(subjectData)<-"subjectId"
XData<-rbind(X_test, X_train)
YData<-rbind(Y_test, Y_train)

#Used to identify activities
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")

#### 3.) Use descriptive activity names to name the activities in the 
####  dataset
names(activity)<-c("activityID","activityLabel")
activity<-mutate(activity, activityLabel=as.character(activityLabel))
activity$activityLabel<-tolower(gsub("_","",activity$activityLabel))

#match the activity with it's ID
activity<-merge(YData, activity, by.x="V1", by.y="activityID")
activity<-activity$activityLabel

#full data table
data<-cbind(subjectData, XData, activity)


### 2.) Extract only the measurements on the mean and standard deviation 
###  for each measurement.

#Used to look up information about data.
features<-read.table("./UCI HAR Dataset/features.txt")
names(features)<-c("featureId", "featureLabel")

#Determine which rows are measurements on the mean and standard deviation
indicator<-grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)


### 4.)Appropriately label the data set with descriptive cariable names
tidy_data<-data[ , indicator]
write.table(data, "clean_merged_data.txt")


###5.) From the data in step 4, create a second, independent tidy data set with the 
### averages of each variable for each activity and each subject.
dataTable<-data.table(tidy_data)
dataTable<-dataTable[,lapply(.SD, mean), by=c("subjectId", "activity")]
write.table(dataTable, "mean_sd_clean_data.txt")
