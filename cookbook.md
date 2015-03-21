#CODEBOOK

##Introduction
The script  run_analysis.R performs the 5 steps described in the course project's definition.
The x_train & x_test, the y_train & y_test, the subject_train and subject_test datasets which have comparable data are merged using rbind() 
descriptive names are given to x_tt (x_train and y_train) combined) this will be used as column name to extract columns with the mean & STD 

using the grep() function the columns were the mean and STD data location are identfied  
subseting the output from the previous step the mean and STD columns are extracted

Subsetting  activities identfied  in activties_label.txt with the y data includes the descriprtive name for each activity creating two columns in the 	y_tt dataset we than name the actvity and subject columns are named respectivly
The mean and STD, the subject and the activies dataset are now all merged using cbind (column bind)
ddply()  from the plyr package summarizes the the average using  colMeans()  
 

##Variables 
x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test, features and activites  are files containg data from the the downloaded files.
x_tt is the merged data of x_train, x_test
y_tt is the merged data of y_train, y_test
Subject_tt is the merged data of subject_train and subject_test

the features variable contains the correct names for the  x_train & test  dataset, which are applied to the column names stored in  x_tt.
the activities variable is combined with the y_tt dataset 
combind_data  merges the  y_tt, select_mn_std , subject_tt into a big dataset.
avg_data is thew veriable containing the results of the ddply() function which is than used to create the averages_data  contains the relevant averages which is stored in a  .txt  file.  


 
   

