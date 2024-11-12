# example data munging / qualtrics
#
# ds 2024-02-23

# load some help for data reading, good column names, tables

library(tidyverse)
library(janitor)
library(gt)
library(qualtRics)


# text coded version
fname_t <- "Demo qq on understanding stats_February 23, 2024_03.43.csv"

# numerically coded
fname <- "Demo qq on understanding stats_February 23, 2024_03.55.csv"

d <- read_csv(fname) %>% clean_names()
e <- read_survey(fname) %>% clean_names()

View(e)

glimpse(e)

# get rid of all the rows that were collected in 2024
cleaned_up_data <- e %>% filter(start_date < "2024-01-01") 

# select out some columns:
cleaned_up_data %>% select(q1,q2,q3) %>% write_csv("mysmall_table.csv")


cleaned_up_data %>% 
  ggplot(aes(x = q2)) +
    geom_histogram()

mean(cleaned_up_data$q2, na.rm = TRUE)
median(cleaned_up_data$q2, na.rm = TRUE)


