# Toronto Paramedic Services Analysis

## Overview

This repository provides readers with all the necessary data, R scripts, and files to understand and reproduce an analysis on Toronto Paramedic Services.


## File Structure

The repository is structured as follows:

- The `scripts` folder contains the R scripts and code that simulated, downloaded, and cleaned the data.
- All of the original data used within this analysis can be found in the `data/raw_data` directory. The data was obtained from the Open Toronto Data Portal. It is important to note that the raw data for Toronto's Paramedic Services is saved in multiple files due to its large size. The original, raw dataset contains data for the years 2017 to 2022. So, this file is saved by year, meaning that there are 6 raw data files in total - one for each year (2017-2022). To open these files through GitHub, they can be downloaded. Alternatively, to view these files within RStudio, they can be imported using the library `readr`.
- The `data/analysis_data` folder holds the cleaned version of the data that were used.
- This analysis includes a map of the data, and this required downloading a shapefile from the Open Government Data portal offered by the Government of Canada. The exact shapefile that is used in the map can be found in the `data/ForwardSortationAreas/Forward_SortationAreas` folder.
- In the the `plan` directory, there is a file with handwritten research notes that helped to better understand Toronto Paramedic Services and motivate this analysis. There is also a file with a plan and sketches on how the data will be organized and visualized. Here, readers will be able to see the thought-process and planning behind this analysis.
- The `paper` folder contains the files used to generate the final report. This includes the Quarto document where the paper was written, a reference bibliography file, and the PDF of the final paper. 


## Statement on LLM usage

LLMs were not used in this analysis in any way. All code and text are written solely by the author of this repository (Julia Lee).