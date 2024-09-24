#### Preamble ####
# Purpose: Simulate the Paramedic Services Incident Data from 2017-2022
# Author: Julia Lee
# Date: 23 September 2024
# Contact: jlee.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: Review the plan and sketches for the analysis in the "other" folder
# Any other information needed? N/A


#### Setting Up the Workspace ####
library(tidyverse)

#### Simulating the Data ####

set.seed(420)

# Want to generate a table that shows the year and the total number of emergency calls 
# made in each year along with the number of calls related to different incident types:
# medical issues, vehicle accidents, emergency transfers, and fires

# Define the starting and ending years

starting_year = 2017
ending_year = 2022

# Generate a number of emergency calls for each year

num_calls = 6

# Generate a random sample of emergency calls for each year
# This should output a table with the years 2017 to 2022 in one column and random
# numbers of emergency calls for each incident type in other columns.

simulated_data <- 
  tibble(
    year = seq(from = starting_year, to = ending_year, by = 1),
    medical_calls = rpois(n = num_calls, lambda = 50000), 
    vehicle_accident_calls = rpois(n = num_calls, lambda = 25000),
    emergency_transfer_calls = rpois(n = num_calls, lambda = 10000),
    fire_calls = rpois(n = num_calls, lambda = 1000))

view(simulated_data)

# The code below adds up the number of calls for each incident type to create a total
# number of emergency calls column

total_emergency_calls = rowSums(simulated_data[,2:5])
total_emergency_calls

# The following code adds the new total column we made to the dataframe, "simulated_data"

simulated_data$total_emergency_calls <- total_emergency_calls
view(simulated_data)

# Save the simulated data as a csv file in data/raw_data
# The csv file will be called "simulated_data.csv"

write_csv(simulated_data, file = "data/raw_data/simulated_data.csv")
