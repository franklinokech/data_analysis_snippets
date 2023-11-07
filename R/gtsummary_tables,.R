library(tidyverse)
library(gtsummary)

# get data
data(CO2)
head(CO2)

# Basic summary table
CO2 %>% select(!c(Plant,conc)) %>% tbl_summary()

# Summary split by a categorical variable
CO2 %>% select(!c(Plant,conc)) %>% tbl_summary(by = Type)

# Split by categorical variable with p-value
CO2 %>% select(!c(Plant,conc)) %>% tbl_summary(by = Type) %>% add_p()

# Customize the presentation of the stats for categorical and the numerical variables
CO2 %>%
  select(-c(Plant, conc)) %>%
  tbl_summary(
    by = Type,
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} / {N} ({p}%)"
    ),
    digits = list(all_continuous() ~ 2)
  ) %>%
  add_p() %>% 
  add_overall() %>% 
  modify_spanning_header(c("stat_1","stat_2") ~ "**Location**")


# Add cross tab
CO2 %>% 
  tbl_cross(
    row = Type,
    col = Treatment,
    percent = "cell"
  ) %>% 
  add_p()
