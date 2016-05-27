# Codebook

###study design
To run this program replace the directory in line 5 with the directory of the users choice
The program cleans the data as follows.

1.  The directory is checked to see if it exists.  If not it creates one.
2.  The working directory is set to the predetermined directory.
3.  The directory is checked to see if it contains the data set.  If not the file is downloaded
from the website.
4.  The data is checked in the file to see if it is unziped.  If not the data is unziped from
it's downloaded format.
5.  The subject_training, X_train, Y_train, data is created from the training data
6.  The subject_test, X_test, Y_test data tables are created from the test data
7.  The subject_test and subject_train data is combined into one data table. 
  The new data table subjectData has it's column's name changed to subjectId.
8.Xdata and Ydata are the merged prodcuts of the X_test, X_train and Y_test, Y_train data
frames respectively
9.  The activity data frame is created
10. The columns of the activity data fram are named "activityID" and "activityLabel"
11. The activityLabel column is changed to a character data type
12. The activity data is merged with the activity data
13.  The activity dataframe stores the activityLabel vector
14.  All the data frames are merged into a data frame called 'data'
15.  The features data frame is read in and given column names "featureID" and "featureLabel"
16.  The rows with mean and standard deviation measurements are identified in the indicator vector
17.  The tidy_data is the rows from the 'data' data frame with the desired information.
18.  The tidy_data data frame is writen out as a text file
19.  The tidy_data data frame is converted to a data table
20.  The datatable takes the standard deviation and mean of the columns based on subjectID and activity.
21.  This new data table is writen out to a text file.
