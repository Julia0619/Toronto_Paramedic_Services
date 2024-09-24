#### Preamble ####
# Purpose: Clean the raw Paramedic Services Incident Data from 2017-2022
# Author: Julia Lee
# Date: 24 September 2024
# Contact: jlee.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download and save the actual Paramedic Services Incident Data from 2017 
# to 2022 from Open Data Toronto
# Any other information needed? As the downloaded raw data is saved into separate files, 
# need to clean each file and then merge them together


#### Setting Up the Workspace ####
library(tidyverse)
library(dplyr)

#### Cleaning the Data ####

# Cleaning Raw 2017 Data

raw_2017 <- read_csv("data/raw_data/raw_data_2017.csv")
#view(raw_2017)

## Creating a new dataframe that contains the number of emergency calls in 2017 for each
## incident type

calls_by_incident_2017 <-
  tibble(
    number_of_medical_calls = sum(raw_2017$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2017$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2017$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2017$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2017$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2017$Incident_Type == "-"),
    )

#view(calls_by_incident_2017)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2017[,1:6])
total_emergency_calls

calls_by_incident_2017$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2017)

------------------------------------------------------------------------------------------

# Cleaning Raw 2018 Data

raw_2018 <- read_csv("data/raw_data/raw_data_2018.csv")
#view(raw_2018)

## Creating a new dataframe that contains the number of emergency calls in 2018 for each
## incident type

calls_by_incident_2018 <-
  tibble(
    number_of_medical_calls = sum(raw_2018$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2018$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2018$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2018$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2018$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2018$Incident_Type == "-"),
  )

#view(calls_by_incident_2018)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2018[,1:6])
total_emergency_calls

calls_by_incident_2018$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2018)

------------------------------------------------------------------------------------------

# Cleaning Raw 2019 Data

raw_2019 <- read_csv("data/raw_data/raw_data_2019.csv")
#view(raw_2019)

## Creating a new dataframe that contains the number of emergency calls in 2018 for each
## incident type

calls_by_incident_2019 <-
  tibble(
    number_of_medical_calls = sum(raw_2019$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2019$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2019$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2019$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2019$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2019$Incident_Type == "-"),
  )

#view(calls_by_incident_2019)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2019[,1:6])
total_emergency_calls

calls_by_incident_2019$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2019)

------------------------------------------------------------------------------------------

# Cleaning Raw 2020 Data

raw_2020 <- read_csv("data/raw_data/raw_data_2020.csv")
#view(raw_2020)

## Creating a new dataframe that contains the number of emergency calls in 2018 for each
## incident type

calls_by_incident_2020 <-
  tibble(
    number_of_medical_calls = sum(raw_2020$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2020$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2020$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2020$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2020$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2020$Incident_Type == "-"),
  )

#view(calls_by_incident_2020)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2020[,1:6])
total_emergency_calls

calls_by_incident_2020$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2020)

------------------------------------------------------------------------------------------

# Cleaning Raw 2021 Data
  
raw_2021 <- read_csv("data/raw_data/raw_data_2021.csv")
#view(raw_2021)

## Creating a new dataframe that contains the number of emergency calls in 2018 for each
## incident type

calls_by_incident_2021 <-
  tibble(
    number_of_medical_calls = sum(raw_2021$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2021$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2021$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2021$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2021$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2021$Incident_Type == "-"),
  )

#view(calls_by_incident_2021)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2021[,1:6])
total_emergency_calls

calls_by_incident_2021$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2021)

------------------------------------------------------------------------------------------
  
# Cleaning Raw 2022 Data
  
raw_2022 <- read_csv("data/raw_data/raw_data_2022.csv")
#view(raw_2022)

## Creating a new dataframe that contains the number of emergency calls in 2018 for each
## incident type

calls_by_incident_2022 <-
  tibble(
    number_of_medical_calls = sum(raw_2022$Incident_Type == "Medical"),
    number_of_vehicle_accident_calls = sum(raw_2022$Incident_Type == 
                                             "Motor Vehicle Accident"),
    number_of_emergency_transfer_calls = sum(raw_2022$Incident_Type == 
                                               "Emergency Transfer"),
    number_of_fire_calls = sum(raw_2022$Incident_Type == "Fire"),
    number_of_airport_standby_calls = sum(raw_2022$Incident_Type == "Airport Standby"), 
    number_of_unclassified_calls = sum(raw_2022$Incident_Type == "-"),
  )

#view(calls_by_incident_2022)

## Adding a total emergency call column to the dataframe

total_emergency_calls = rowSums(calls_by_incident_2022[,1:6])
total_emergency_calls

calls_by_incident_2022$total_number_of_emergency_calls <- total_emergency_calls
#view(calls_by_incident_2022)

------------------------------------------------------------------------------------------

# Merging Cleaned Data 

merged_cleaned_data <- rbind(calls_by_incident_2017, calls_by_incident_2018, 
                            calls_by_incident_2019, calls_by_incident_2020, 
                            calls_by_incident_2021, calls_by_incident_2022)
#view(merged_cleaned_data)

# Adding in the year column and bringing it to the front

merged_cleaned_data$Year <- c(2017, 2018, 2019, 2020, 2021, 2022)
#view(merged_cleaned_data)

ordered_cleaned_data <- merged_cleaned_data %>% relocate(Year)
#view(ordered_cleaned_data)

# Changing column names 

names(ordered_cleaned_data)

final_cleaned_data <-
  ordered_cleaned_data |>
  rename(
    Medical_Emergency_Calls = number_of_medical_calls,
    Vehicle_Accident_Calls = number_of_vehicle_accident_calls,
    Emergency_Transfer_Calls = number_of_emergency_transfer_calls,
    Fire_Calls = number_of_fire_calls, 
    Airport_Standby_Calls = number_of_airport_standby_calls,
    Unclassified_Emergency_Calls = number_of_unclassified_calls,
    Total_Emergency_Calls = total_number_of_emergency_calls)

#view(final_cleaned_data)

------------------------------------------------------------------------------------------

#### Saving the Data ####

# Save the cleaned data as a csv file in data/analysis_data
# The csv file will be called "analysis_data.csv"

write_csv(final_cleaned_data, file = "data/analysis_data/analysis_data.csv")

------------------------------------------------------------------------------------------
  
#### Testing Cleaned Data ####

# Test 1: Testing whether the total number of emergency calls is the sum of calls related 
# to each of the four incident types
# This test will help to double check whether the number of calls for each incident type 
# correctly add up to the total number of emergency calls

test_cleaned_data <- read_csv("data/analysis_data/analysis_data.csv")
#view(test_cleaned_data)

test_cleaned_data$Total_Emergency_Calls == rowSums(test_data[,2:7])

# Test 2: Testing whether there are any null or negative  values in the dataframe
# As it is very unlikely to not have any calls and because it does not make sense to have 
# a negative number of emergency calls for any incident type, this test will be useful in
# identifying any mistakes that may exist within the data

## Test for null values within the whole dataframe
is.na(test_cleaned_data)

## Test for negative values within the whole dataframe
test_cleaned_data <= 0
