install.packages("gitignore")
library(gitignore)
# print git ignore template
gi_fetch_templates("R")
#note: generate personal access token to push repo

# load tidyverse and it's libraries
library(tidyverse)
library(readxl)
library(dplyr)

# for data cleaning
library(janitor)

# check working directory
getwd()

# check the excel sheet names from excel file
readxl::excel_sheets("/Users/marie-louise/Documents/sites/quarterly_release_y:e_sept_20/returns-datasets-sep-2020.xlsx")

# dataframe_name <- readxl::read_excel(file_path)
# or - readxl::excel_sheets(file_path)

raw_data_1 <- readxl::read_excel("/Users/marie-louise/Documents/sites/quarterly_release_y:e_sept_20/returns-datasets-sep-2020.xlsx",
                                 sheet = "Data - Ret_D01")
# open file in viewer
View(raw_data_1)

# clean data

clean_raw_data <- janitor::clean_names(raw_data_1)

# open file in viewer
View(clean_raw_data)

# inspect data
# check column / field names
names(clean_raw_data)
