train_x <- data.table::fread("X_train.txt")
train_y <- data.table::fread("y_train.txt", col.names = c("label"))
test_x <- data.table::fread("X_test.txt")
test_y <- data.table::fread("y_test.txt", col.names = c("label"))
subject_train <- data.table::fread("subject_train.txt", col.names = c("subject"))
subject_test <- data.table::fread("subject_test.txt", col.names = c("subject"))
train_x$label <- train_y
test_x$label <- test_y
mergedData <- rbind(train_x, test_x)
subject <- rbind(subject_train, subject_test)
feature <- data.table::fread("features.txt")
feature <- rbind(feature, list(562, "label"))
colnames(mergedData) <- feature$V2
mergedData <- cbind(mergedData, subject)
install.packages("tidyverse")
library(tidyverse)
mergedData <- mergedData %>% select(matches("mean()|Mean()|MEAN()|std()|STD()|Std()|label|subject"))
renaming <- function(x){
  y <- character(0)
  if(x == 1){
    y <- "WALKING"
  }
  else if(x == 2){
    y <- "WALKING_UPSTAIRS"
  }
  else if(x == 3){
    y <- "WALKING_DOWNSTAIRS"
  }
  else if(x == 4){
    y <- "SITTING"
  }
  else if(x == 5){
    y <- "STANDING"
  }
  else{
    y <- "LAYING"
  }
  y
}
mergedData$label <- sapply(mergedData$label, renaming)
summarize_mergedData <- mergedData %>% group_by(label, subject) %>% summarize_all(list(mean))
summarized_mergedData <- write.table(summarize_mergedData, file = "summarized_mergedData", row.names = FALSE)