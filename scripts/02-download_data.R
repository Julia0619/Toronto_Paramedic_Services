#### Preamble ####
# Purpose: Download and save the actual Paramedic Services Incident Data from 2017 to 2022
# from Open Data Toronto
# Author: Julia Lee
# Date: 23 September 2024
# Contact: jlee.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Setting Up the Workspace ####

library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Downloading the Data #### 

package <- show_package("c21f3bd1-e016-4469-abf5-c58bb8e8b5ce")

resources <- list_package_resources("c21f3bd1-e016-4469-abf5-c58bb8e8b5ce")

datastore_resources <- filter(resources, tolower(format) %in% c('xlsx', 'geojson'))

data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()

data

#### Saving the Data ####
# Save the downloaded data as a csv file in data/raw_data
# The csv file will be called "raw_data.csv"

write_xl(data, "data/raw_data/raw_data.xlsx") 
