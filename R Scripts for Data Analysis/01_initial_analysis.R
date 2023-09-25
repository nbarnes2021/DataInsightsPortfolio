#Market Basket Analysis

#Importing Libraries
library(here)
library(arules)
library(arulesViz)
library(datasets)

#Initializing working directory and importing dataset
here::here()
OnlineRetailCleansed <- read.csv(here("../../Data/OnlineRetailCleansed.csv"))

#Imports data for
basket_data <- read.transactions("../../Data/OnlineRetailCleansed.csv", format = "single", sep = ",", cols = c(1,3), skip = 1)

#Viewing first few rows
inspect(head(basket_data,4))

#Visualizing top 20 most sold items in a horizontal bar chart
itemFrequencyPlot(basket_data, topN=20, type= "absolute", horiz=TRUE)

#Displays item purchase amount and the percentage of carts that contain it
head(itemFrequency(basket_data))


#Notes for me: cont on this with the video, then clean up both the code and documentation for github. Add your findings and done
#data <- read.csv("../../Data/OnlineRetailCleansed.csv")

# Read the transactions data
basket_data2 <- read.transactions("../../Data/OnlineRetailCleansed.csv", format = "single", sep = ",",   cols = c(1, 3),skip = 1, header = FALSE, quote = "")

# Get item frequency
# Get item frequency
item_freq <- itemFrequency(basket_data2)

# Display the top items
head(item_freq)

# Convert item frequency to a data frame
item_freq <- as.data.frame(item_freq)

# Set the number of decimal places you want for frequencies
num_decimal_places <- 4  # You can adjust this as needed

# Format frequencies to display with a fixed number of decimal places
item_freq$Frequency <- format(item_freq$Frequency, nsmall = num_decimal_places)

# Display the top items
head(item_freq)

# Set options to display frequencies without scientific notation
options(scipen = 999)

# Display the top items with frequencies
head(item_freq)

inspect(head(basket_data2))
itemFrequency(basket_data2)[1:10]

length(basket_data2)
itemFrequency(basket_data2)[grep("LOVE", itemLabels(basket_data2))]

min_support <- (100 / length(basket_data)) / 100
rules <- apriori(basket_data2, parameter = list(supp = min_support, conf = 0.8, minlen = , maxlen = 4), control = list(verbose = FALSE))
inspect(rules[1:5])
#supp = 100/length(basket_data2)
