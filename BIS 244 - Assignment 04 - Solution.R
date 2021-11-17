# Solution file for BIS 244 Assignment 4 Fall 2021

library(tidyverse)
library(scales)
library(ggrepel)   
Movies <- read_csv("Top_10000_Popular_Movies.zip")
str(Movies)
Movies$year <- format(as.Date(Movies$release_date), format = "%Y")
Movies <- Movies[which(Movies$year>="2020" &
                   Movies$year<="2021"),]


p <- ggplot(data = Movies,
            mapping = aes(x = release_date, y = popularity))
p + geom_point()

p + geom_point() +
  geom_text_repel(data = subset(Movies, popularity > 500,
                                max.overlaps = Inf),
                  mapping = aes(label = original_title)) +
  labs(x = "Release Date",
       y = "Popularity Score",
       title = "Top 10,000 Most Popular Movies") +
  scale_y_continuous(labels = scientific)

