# README file
The following files are contained in this repsoitory:
*readme.md
*cleanData.r
*codebook.md
*clean_merged_data.txt
*mean_sd_clean_data.txt

### cleanData.r
The following packages are used in the analysis:
*dplyr
*datatable

The first three iff statements should be replaced with the directory of the users choice.
If the script is run for the first time it checks if the files have been previously downloaded.
If not the files are gathered from the interenet and downloaded into the prescribed location.

Next the data is merged.  During this process some lables are used to give more descriptive
column names based on the readme.txt file that comes with the downloaded zip file.

The measurements including mean and standard deviation are then extracted from the data.

A tidy_data data frame is created using only the rows with the desired condtions. This table
is writen to a a text file.
The next tidy data set is created containing standared deviations and means of each element in the 
data table.  This is then written out to a data table.

### codebook
The codebook contains information about the data set and variable names.