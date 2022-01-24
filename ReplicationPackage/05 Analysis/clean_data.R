rm(list=ls())
library(plyr)
library(tidyr)

# loading data
data1 = read.table("parsed_data_v02.txt", header = TRUE, sep = ",", dec = ".")
data2 = read.table("parsed_data_v03.txt", header = TRUE, sep = ",", dec = ".")

# remove the uncompleted sites from data1 that were tested again in data2
data1 = data1[!(data1$site %in% data2$site),]

# replace zero values with NA
data1$lt[data1$lt==0] <- NA
data1$fp[data1$fp==0] <- NA
data1$fcp[data1$fcp==0] <- NA
data1$e[data1$e==0] <- NA

data2$lt[data2$lt==0] <- NA
data2$fp[data2$fp==0] <- NA
data2$fcp[data2$fcp==0] <- NA
data2$e[data2$e==0] <- NA

# drop missing values
data1 = drop_na(data1)
data2 = drop_na(data2)

# append data2 to data1
data = rbind(data1, data2)

# remove unnecessary columns
data = subset(data, select = -c(i) )
data = subset(data, select = -c(X) )

# remove the sites with less than 40 runs
count1 = count(data, "site")
remove_sites = count1[count1$freq<40,]
data = data[!(data$site %in% remove_sites$site),]

# write data to txt file
write.table(data, "final_data.txt", append = FALSE, sep = ",", dec = ".",
            row.names = TRUE, col.names = TRUE, quote=FALSE)

write.table(sort(unique(data$site)), "tested_sites.txt", append = FALSE, sep = ",", dec = ".",
            col.names = FALSE, quote=FALSE, row.names=FALSE)

