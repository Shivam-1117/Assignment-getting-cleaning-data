## Codebook
## Variables used in run_analysis.R script:
## 1. train_x : training set containing the "X_train" data.
## 2. train_y : training set containing the "y_train" data.
## 3. test_x : test set containing the "X_test" data.
## 4. test_y : test set containing the "y_test" data.
## 5. mergedData : dataset after merging the training and test data.
## 6. subject_train : training dataset containing the file "subject_train".
## 7. subject_test : test dataset containing the file "subject_test".
## 8. subject : dataset after merging the "subject_train" and "subject_test" dataset.
## 9. feature : "features.txt" dataset.
## 10. renaming() : function "renaming" is used to convert the interger values of "activities" to descriptive.
## 11. summarize_mergedData : a tidy dataset, average of each variable for each activity and each subject.
## 12. summarized_mergedData : a tidy data set file
## Steps taken to clean the dataset:
## 1. read the training and test data, train_x, train_y, test_x, test_y.
## 2. read the subjects datset file.
## 3. add "label" column in train_x and test_x with "label" from train_y and test_y.
## 4. merge train_x and test_x dataset.
## 5. merge the subjects for train and test set.
## 6. read the "features.txt" file and add the "label" row in it.
## 7. add the subject column to merged dataset.
## 8. include the library "tidyverse" to the dataset.
## 9. extracts only the measurements on the mean and standard deviation for each measurement.
## 10. define renaming().
## 11. rename the label column in the merged dataset.
## 12. independent tidy data set with the average of each variable for each activity and each subject.
## 13. write the final "summarized_mergedData".