# Solution file for BIS 244 Assignment 02, Fall 2020

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

# Let's read in the us-counties file from covid-19-data

# We'll use packages readr, which is part of the tidyverse,
# and here
library(tidyverse)
library(here)

# Reading the us-states.csv in as a data frame
STATES <- read_csv(here("covid-19-data","us-states.csv"))

# Examining the data
# View(STATES)

# Using filter()to get just PA
PA <- filter(STATES, state=="Pennsylvania")
# View(PA)

# Set n to legth of data set
n <- length(PA$date)

# Initialize new variables in data frame
PA$incr_deaths <- 0
PA$incr_cases <- 0

PA$incr_deaths[1] <- PA$deaths[1]
PA$incr_cases[1] <- PA$cases[1]

# Calculate values for incremental cases and deatchs
for (i in 2:n) {
  PA$incr_cases[i] <- PA$cases[i] - PA$cases[i-1]
  PA$incr_deaths[i] <- PA$deaths[i] - PA$deaths[i-1]
}

# Calculating sum of all adjusted deaths as checksum
sd(PA$incr_cases)
