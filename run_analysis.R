# Getting and Cleaning Data - Course Project

# Read raw data files (assumes local copies saved to current directory)
xTrain <- read.table("./X_train.txt")
xTest <- read.table("./X_test.txt")
yTrain <- read.table("./Y_train.txt")
yTest <- read.table("./Y_test.txt")
subjectTrain <- read.table("./subject_train.txt")
subjectTest <- read.table("./subject_test.txt")
activityLabels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

# Prepend Subject and Activity info to measurement data for train and test sets
train <- cbind(subjectTrain, yTrain, xTrain)
test <- cbind(subjectTest, yTest, xTest)
# Combine train and test sets into one table
combined <- rbind(train, test)

# Make readable column names for subject and activity
colnames(combined)[1:2] <- c("Subject", "Activity")
# Add names of measurement columns from the feature info file
colnames(combined)[3:563] <- c(as.character(features[,2]))

# Subset the table to include only mean and std deviation data
combined <- combined[, grepl("Subject|Activity|-mean\\(|-std\\(", names(combined))]

# Replace activity keys with readable names
combined[combined$Activity==1,2] <- "Walking"
combined[combined$Activity==2,2] <- "Walking upstairs"
combined[combined$Activity==3,2] <- "Walking downstairs"
combined[combined$Activity==4,2] <- "Sitting"
combined[combined$Activity==5,2] <- "Standing"
combined[combined$Activity==6,2] <- "Laying"

# Create aggregated data set of mean values for each measurement, grouped by Subject and Activity 
aggregated <- aggregate(combined[,3:68], by=list(combined$Subject, combined$Activity), FUN=mean, na.rm=TRUE)
# Replace generated group column names with meaningful ones
colnames(aggregated)[1:2] <- c("Subject", "Activity")

# Write resulting aggregated mean data to a text file
write.table(aggregated, "./aggregated.txt", row.names=FALSE)
