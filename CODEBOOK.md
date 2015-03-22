#CODEBOOK

##Variables 
x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test, features and activites  are files containg data from the the downloaded files.
x_tt is the merged data of x_train, x_test
y_tt is the merged data of y_train, y_test
Subject_tt is the merged data of subject_train and subject_test

the features variable contains the correct names for the  x_train & test  dataset, which are applied to the column names stored in  x_tt.
the activities variable is combined with the y_tt dataset 
combind_data  merges the  y_tt, select_mn_std , subject_tt into a big dataset.
avg_data is thew veriable containing the results of the ddply() function which is than used to create the averages_data  contains the relevant averages which is stored in a  .txt  file.  


 
   

