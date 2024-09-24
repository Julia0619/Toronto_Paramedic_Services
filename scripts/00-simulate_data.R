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
# made in each year

# Define the starting and ending years

starting_year = 2017
ending_year = 2022

# Generate a number of emergency calls for each year

num_calls = 6

# Generate a random sample of emergency calls for each year
# This should output a table with the years 2017 to 2022 in one column and random
# numbers of emergency calls in another column.

simulated_data <- 
  tibble(
    year = seq(from = starting_year, to = ending_year, by = 1), 
    number_of_calls = rpois(n = num_calls, lambda = 100000))

view(simulated_data)

# Save the simulated data as a csv file in data/raw_data
# The csv file will be called "simulated_data.csv"

write_csv(simulated_data, file = "data/raw_data/simulated_data.csv")
