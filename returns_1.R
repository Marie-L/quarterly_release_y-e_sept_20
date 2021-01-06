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

# clean column names (use gsub on work laptop)
clean_raw_data <- janitor::clean_names(raw_data_1)

# open file in viewer
View(clean_raw_data)

# inspect data
# check column / field names
names(clean_raw_data)

# filter data
# %>% pipe operator, shortcut = Cmd + Shift + M, to chain sequences together   
filtered_data <- clean_raw_data %>%
  # select variables / column names
  select(quarter,
         return_type_group,
         return_type,
         number_of_returns) %>% 
  # filter on all the selected vars, check if any vars meet the condition, detect the pattern in a string
  filter_all(any_vars(str_detect(.,pattern = ('2010|2011|2012|2013|2014|2015|2016|2017|2018|2019|2020'))))

# View filtered data 
View(filtered_data)

# double check var names
names(filtered_data)

# Manual checking:
# for each column/ var except number_of_returns , use unique() to eliminate duplicate values
# use $ to access var name from inside the list (instead of [1])
unique(filtered_data$return_type_group)
unique(filtered_data$quarter)

unique(filtered_data$return_type)
# In return_type "Non-detained enforced removals" and "Non-detained Enforced removals"
# are similar except one has a capital E 


