#### Preamble ####
# Purpose: Test the simulated data 
# Author: Julia Lee
# Date: 23 September 2024
# Contact: jlee.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: Simulate the Paramedic Services Incident Data from 2017 to 2022
# Any other information needed? N/A


#### Setting Up the Workspace ####
library(tidyverse)

#### Testing the Data ####

# Read in the simulated data

data <- read_csv("data/raw_data/simulated_data.csv")
view(data)

# Test 1: Testing whether the total number of emergency calls is the sum of calls related 
# to each of the four incident types
# This test will help to double check whether the number of calls for each incident type 
# correctly add up to the total number of emergency calls

data$total_emergency_calls == rowSums(data[,2:7])

# Test 2: Testing whether there are any null or negative  values in the dataframe
# As it is very unlikely to not have any calls and because it does not make sense to have 
# a negative number of emergency calls for any incident type, this test will be useful in
# identifying any mistakes that may exist within the data

## Test for null values within the whole dataframe
is.na(data)

## Test for negative values within the whole dataframe
data <= 0
