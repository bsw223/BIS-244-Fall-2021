# Solution file for BIS 044 Assignment Exam 1 Applied Questions
library(tidyverse)

chess <- read_csv("Player_piece_info.zip")

# str(chess)



p <- ggplot(data = chess,
            mapping = aes(x = player, fill = color))
p + geom_bar() +
  labs(x = NULL, y = "Height = Proportion",
       title = "Color Play by Chess Master Across All Games")
