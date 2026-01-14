# 00_extract_institution_names.R

# Purpose: Imports the course roster CSV and extracts unique institution names
# associated with LDP students in the years 2020 through 2022 inclusive

# Inputs:  data/raw_data/LDP_course-rosters_repro-data_2020-2023.csv
# Outputs: data/processed_data/LDP_unique-institutions_2020_2022.csv
# 
# Author: Jason Pither
# Updated: 2026-01-13

# required R packages: dplyr, readr, here

# load libraries
library(dplyr)
library(readr)
library(here)

roster <- readr::read_csv(here::here("data", "raw_data", "LDP_course-rosters_repro-data_2020-2023.csv"))

# get unique values
unique_institutions <- roster %>%
  reframe(institution_name = unique(Institution_ID))

# export to CSV
readr::write_csv(unique_institutions, here::here("data", "processed_data", "LDP_unique-institutions_2020_2022.csv"))

# DONE