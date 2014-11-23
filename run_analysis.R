library(plyr)

run_analysis <- function() {
  test_data <- read.fwf("UCI HAR Dataset/test/X_test.txt", widths = rep(16, times=561))
  test_data_activity <- read.csv("UCI HAR Dataset/test/Y_test.txt")
  test_data$activity <- test_data_activity[, 1]
  test_data_subject <- read.csv("UCI HAR Dataset/test/subject_test.txt")
  test_data$subject <- test_data_subject[, 1]
  
  train_data <- read.fwf("UCI HAR Dataset/train/X_train.txt", widths = rep(16, times=561))
  train_data_activity <- read.csv("UCI HAR Dataset/train/Y_train.txt")
  train_data$activity <- train_data_activity[, 1]
  train_data_subject <- read.csv("UCI HAR Dataset/train/subject_train.txt")
  train_data$subject <- train_data_subject[, 1]
  
  data <- rbind(test_data, train_data)
  
  col_names <- read.table("UCI HAR Dataset/features.txt", sep=" ")
  colnames(data) <- col_names[[2]]
  colnames(data)[562] = "activity_id"
  colnames(data)[563] = "subject"
  
  activity_names <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")
  colnames(activity_names) = c("activity_id", "activity_label")
  
  data <- join(data, activity_names)  
  data$as <- paste(data$activity_label,'/',data$subject)
  
  result <- data.frame()
  index <- 1
  
  for(dim1 in colnames(data)) {
    if (dim1 != 'activity_id' && dim1 != 'subject' && dim1 != 'activity_label' && dim1 != 'as') {
      val <- lapply(split(data[[dim1]], data$as), mean)
      val <- unlist(val)
      
      for (dim2 in names(val)) {
        result[index, 'activity / subject'] <- dim2
        result[index, 'variable'] <- dim1
        result[index, 'average value'] <- val[[dim2]]
        index <- index + 1
      }
    }
  }
  
  result
}
