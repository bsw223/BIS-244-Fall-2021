# Solution file for BIS 244 Assignment 03, Fall 2021
if (!require("here")) install.packages("here")
library(here)
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)


votes <- read_csv(here("Data","PRESIDENT_precinct_general.zip"))
n_votes <- length(votes$office)
states <- distinct(votes,state,.keep_all=TRUE)
states <- subset(states,select=state)
states$Biden <- 0
states$Trump <- 0
n_states <- length(states$state)

COUNTER <- 0

for (i in 1:n_votes) {
  for (j in 1:n_states) {
    if (votes$state[i] == states$state[j]) {
      if (votes$candidate[i] == "JOSEPH R BIDEN") {
        states$Biden[j] <- states$Biden[j] + votes$votes[i] 
      }
      if (votes$candidate[i] == "DONALD J TRUMP") {
        states$Trump[j] <- states$Trump[j] + votes$votes[i] 
      }
      j <- n_states
    }
  }
  # Following is just to give "visual feedback"  
  if (round(i/n_votes*100, digits = 0) > COUNTER) {
    COUNTER <- round(i/n_votes*100, digits = 0)
    cat(COUNTER,"pct complete\n")}
}

p <- ggplot(data = states,
            mapping = aes(x = Biden,
                          y = Trump))

p + geom_point()
p + geom_point(color="red") + geom_text(mapping = aes(label = state))
