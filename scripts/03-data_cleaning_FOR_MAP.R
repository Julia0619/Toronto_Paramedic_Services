#### Preamble ####
# Purpose: Clean the raw Paramedic Services Incident Data from 2017-2022 to map it
# Author: Julia Lee
# Date: 24 September 2024
# Contact: jlee.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download and save the actual Paramedic Services Incident Data from 2017 
# to 2022 from Open Data Toronto
# Any other information needed? N/A


#### Setting Up the Workspace ####
library(tidyverse)
library(dplyr)

#### Cleaning the Data ####

# Want to map the number of calls each forward sortation area had in 2022 for each incident type
# So, need to take Raw 2022 data and organize it to get a list of forward sortation areas with its 
# corresponding number of emergency calls 

## Reading in Raw 2022 data  

data <- read_csv("data/raw_data/raw_data_2022.csv")
#view(data)

## Find unique forward sortation areas (fsa)
 
find_fsa <- unique(data$Forward_Sortation_Area)
find_fsa

## Organize data by fsa

organized_data <- data[order(data$Forward_Sortation_Area, decreasing = TRUE),]
#view(organized_data)

## As there are many rows with "-" as the forward sortation area, want to remove them

fsa_data <- organized_data[-c(288555:288690),]
#view(fsa_data)

## Now, want to remove "...1", "ID", "Dispatch_Time", "Priority_Number", and "Units_Arrived_At_Scene" columns

fsa_data_2 <- fsa_data[,-c(1:3,5:6)]
#view(fsa_data_2)

## Need to create a new dataframe that lists each fsa and its number of incidents for each incident type

### First, create a dataframe that has each fsa in a single row and a list of all the incident types in 
### a column

fsa_data_3 <- fsa_data_2 |> 
  group_by(Forward_Sortation_Area) |> 
  summarise(Incident_Type = paste(Incident_Type, collapse = ","))
#view(fsa_data_3)

### Second, create columns that contain the number of incidents for each incident type for each fsa

fsa_data_3$"Emergency Transfers" <- str_count(fsa_data_3$Incident_Type, "Emergency Transfer")
#view(fsa_data_3)

fsa_data_3$"Medical Emergencies" <- str_count(fsa_data_3$Incident_Type, "Medical")
#view(fsa_data_3)

fsa_data_3$"Vehicle Accidents" <- str_count(fsa_data_3$Incident_Type, "Motor Vehicle Accident")
#view(fsa_data_3)

fsa_data_3$"Fires" <- str_count(fsa_data_3$Incident_Type, "Fire")
#view(fsa_data_3)

fsa_data_3$"Airport Standbys" <- str_count(fsa_data_3$Incident_Type, "Airport Standby")
view(fsa_data_3)

## Add a column that contains the name of the incident type that had the most demand for each fsa

fsa_data_3$"EMS Demand Driver" <- colnames(fsa_data_3)[apply(fsa_data_3,1,which.max)]
#view(fsa_data_3)

## Change the "Forward_Sortation_Area" column name to "CFSAUID" - this is the name of the column
## with the forward sortation areas in the shapefile, so having the same column name can make it 
## easier to join this cleaned data to the shapefile

fsa_data_3 <-
  fsa_data_3 |>
  rename(
    CFSAUID = Forward_Sortation_Area
  )
view(fsa_data_3)

------------------------------------------------------------------------------------------

#### Saving the Data ####

# Save the cleaned data as a csv file in data/analysis_data
# The csv file will be called "analysis_data_FOR_MAP.csv"

write_csv(fsa_data_3, file = "data/analysis_data/analysis_data_FOR_MAP.csv")

------------------------------------------------------------------------------------------

#### Testing Cleaned Data ####

# Test 1: The original test of whether the total number of emergency calls is the sum of calls related 
# to each of the four incident types cannot be applied to this dataset as there is no total
# So, will test if the value for Emergency Transfer calls is equal to the count in the "Incident_Type"
# column

test_clean_map_data <- read_csv("data/analysis_data/analysis_data_FOR_MAP.csv")
#view(test_clean_map_data)

test_clean_map_data$`Emergency Transfers` == str_count(test_clean_map_data$Incident_Type, "Emergency Transfer")

# Test 2: Testing whether there are any null or negative  values in the dataframe
# As it is very unlikely to not have any calls and because it does not make sense to have 
# a negative number of emergency calls for any incident type, this test will be useful in
# identifying any mistakes that may exist within the data

## Test for null values within the whole dataframe
is.na(test_clean_map_data)

## Test for negative values within the whole dataframe
test_clean_map_data <= 0
