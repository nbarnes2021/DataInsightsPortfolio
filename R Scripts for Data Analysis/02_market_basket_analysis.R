#Market Basket Analysis


#Install Packages
install.packages("here")
install.packages("arules")
install.packages("arulesViz")
install.packages("datasets")
install.packages("readr")
install.packages("tidyverse")

#Importing Libraries
library(here)
library(arules)
library(arulesViz)
library(datasets)
library(readr)
library(tidyverse)

#Initializing working directory and importing dataset
here::here()
OnlineRetailDataset <- read.csv(here("../../Data/OnlineRetailFiltered.csv"))

#Preview dataset
head(OnlineRetailDataset)

#Removing null columns
OnlineRetailDataset <- OnlineRetailDataset %>%
  select(-c(X, X.1, X.2))

#Preview dataset
head(OnlineRetailDataset)

# Converting and factoring the InvoiceDate column
OnlineRetailDataset$InvoiceDate <- OnlineRetailDataset$InvoiceDate %>%
  as.Date(OnlineRetailDataset$InvoiceDate, format = "%m/%d/%Y")

OnlineRetailDataset$MonthYear <- format(OnlineRetailDataset$InvoiceDate, format = "%B %Y")
OnlineRetailDataset$MonthYear <- as.factor(OnlineRetailDataset$MonthYear)

#Preview dataset
head(OnlineRetailDataset)

#Grouping transactions into baskets
OnlineRetailBaskets <- OnlineRetailDataset %>%
  group_by(InvoiceNo, InvoiceDate) %>%
  summarize(Transaction = paste(Description, collapse = ",")) %>%
  ungroup() %>%
  mutate(Transaction = strsplit(Transaction, ",")) %>%
  select(InvoiceNo, Transaction)

#Preview dataset
head(OnlineRetailBaskets)

#Add the MonthYear column for further analysis
OnlineRetailBaskets <- merge(OnlineRetailBaskets, OnlineRetailDataset[c("InvoiceNo", "MonthYear")], by = "InvoiceNo", all.x = TRUE)

#Removing Duplicates
OnlineRetailBaskets <- OnlineRetailBaskets %>%
  distinct(InvoiceNo, Transaction, MonthYear, .keep_all = TRUE)

#Flattens data
OnlineRetailBaskets$Transaction <- sapply(OnlineRetailBaskets$Transaction, function(x) paste(x, collapse = ","))

#Transform into Transaction Object
#Exporting file

# Convert the transaction object to a data frame
OnlineRetailBaskets_df <- as(OnlineRetailBaskets, "data.frame")

#remove other columns for cleaner analysis
baskets <- OnlineRetailBaskets_df
baskets$InvoiceNo <- NULL
baskets$MonthYear <- NULL

# Export the data frame to a CSV file
write.csv(baskets, file = here("../../Data/OnlineRetailBaskets.csv"), row.names = FALSE)

#import data
baskets <- read.transactions(here("../../Data/OnlineRetailBaskets.csv"), format = "basket", sep = ",", encoding = "UTF-8")

#running the apriori algorithm
rules <- apriori(baskets, parameter = list(support = 0.0000000001, confidence = 0.1))

# View the first few association rules
inspect(head(rules))

#Retrying using full data
#Initializing working directory and importing dataset
here::here()
OnlineRetailDataset <- read.csv(here("../../Data/OnlineRetailCleansed.csv"))

#Preview dataset
head(OnlineRetailDataset)

#Grouping transactions into baskets
OnlineRetailBaskets <- OnlineRetailDataset %>%
  group_by(InvoiceNo, InvoiceDate) %>%
  summarize(Transaction = paste(Description, collapse = ",")) %>%
  ungroup() %>%
  mutate(Transaction = strsplit(Transaction, ",")) %>%
  select(InvoiceNo, Transaction)

#Preview dataset
head(OnlineRetailBaskets)

#Remove InvoiceNo
OnlineRetailBaskets$InvoiceNo <- NULL

#Flattens data
OnlineRetailBaskets$Transaction <- sapply(OnlineRetailBaskets$Transaction, function(x) paste(x, collapse = ","))

#Transform into Transaction Object
#Exporting file

# Convert the transaction object to a data frame
OnlineRetailBaskets_df <- as(OnlineRetailBaskets, "data.frame")


# Export the data frame to a CSV file
write.csv(OnlineRetailBaskets_df, file = here("../../Data/OnlineRetailBaskets.csv"), row.names = FALSE)

#import data
baskets <- read.transactions(here("../../Data/OnlineRetailBaskets.csv"), format = "basket", sep = ",", encoding = "UTF-8")

#running the apriori algorithm
rules <- apriori(baskets, parameter = list(support = 0.001, confidence = 0.8))

rules <- apriori(baskets, parameter = list(supp = 0.001, conf = 0.8, minlen = 1, maxlen = 4), control = list(verbose = FALSE))

# Min Support as 0.001, confidence as 0.8.
association.rules <- apriori(baskets, parameter = list(supp=0.001, conf=0.8,maxlen=10))

# View the first few association rules
inspect(head(rules))
