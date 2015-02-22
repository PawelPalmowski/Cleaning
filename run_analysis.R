#Download the training dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
#Unzip the training dataset
library(downloader)
unzip("dataset.zip", exdir="./dataset")
#Loading datasets
X_train<-read.table("./dataset/UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("./dataset/UCI HAR Dataset/test/X_test.txt")
#Adding labels
colnames(X_train)<-read.table("./dataset/UCI HAR Dataset/features.txt")[,2]
colnames(X_test)<-read.table("./dataset/UCI HAR Dataset/features.txt")[,2]
X_train<-cbind(read.table("./dataset/UCI HAR Dataset/train/subject_train.txt"), read.table("./dataset/UCI HAR Dataset/train/y_train.txt"), X_train)
X_test<-cbind(read.table("./dataset/UCI HAR Dataset/test/subject_test.txt"), read.table("./dataset/UCI HAR Dataset/test/y_test.txt"), X_test)
colnames(X_train)[1]<-"subject"
colnames(X_test)[1]<-"subject"
colnames(X_train)[2]<-"activity"
colnames(X_test)[2]<-"activity"
#Merging datasets
dataset<-X_test
rm(X_test)
dataset<-rbind(dataset, X_train)
rm(X_train)
#Adding descriptive variable name
act<-merge(dataset[,2], read.table("./dataset/UCI HAR Dataset/activity_labels.txt"), by.x=1, by.y=1)
act<-act[ ,2]
dataset$activity<-act
rm(act)
#Extracting mean and stdev
colnames(dataset)<-gsub("meanFreq", "Freq", colnames(dataset))
dataset_mean<-dataset[ ,grepl("mean()", colnames(dataset))]
dataset_std<-dataset[ ,grepl("std()", colnames(dataset))]
dataset<-cbind(dataset[1:2], dataset_mean, dataset_std)
rm(dataset_mean)
rm(dataset_std)
#Creating a tidy dataset
library(dplyr)
sub<-group_by(dataset, subject)
act<-group_by(dataset, activity)
rm(dataset)
act<-summarise_each(act, funs(mean), -subject)
sub<-summarise_each(sub, funs(mean), -activity)
s<-as.vector(sub$subject)
a<-as.vector(act$activity)
rownames(act)<-a
rownames(sub)<-s
rm(a)
rm(s)
act[ ,1]<-NULL
sub[ ,1]<-NULL
tidy_dataset<-rbind(act, sub)
rm(sub)
rm(act)
#Save the tidy dataset
write.table(tidy_dataset, file="tidy_dataset.txt", row.names=FALSE)
#Cleaning the workspace
rm(list = ls(all = TRUE))
