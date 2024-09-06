# RTT Data

# Imports + Theme
library(readr)
library(ggplot2)
library(data.table)
library(tidyverse)

library(ggthemes) # Load
library(tidyquant)

colours <- c("#ea5545", "#f46a9b", "#ef9b20", "#edbf33", "#ede15b", "#bdcf32", "#87bc45", "#27aeef", "#b33dc6")


theme_lab <- function () { 
  theme_grey(base_size = 14, base_family = "sans") %+replace% 
    theme(
      # plot margin
      plot.margin = unit(rep(0.5, 4), "cm"),
      # plot background and border
      plot.background = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      # grid lines
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(size = 0.5, color = "#cbcbcb"), 
      panel.grid.minor = element_blank(),
      # axis ticks and lines
      axis.ticks = element_blank(),
      axis.line = element_blank(),
      # title, subtitle and caption
      plot.title = element_text(size = 20, face = "bold", colour = "#757575", hjust = 0),
      plot.subtitle = element_text(size = 16, colour = "#757575", hjust = 0, margin = margin(9, 0, 9, 0)),
      plot.caption = element_text(size = 10, color = "grey50", hjust = 1, margin = margin(t = 15)),
      # axes titles
      axis.title = element_text(colour = "#757575", hjust = 1),
      axis.text.x = element_text(margin = margin(b = 7)),
      axis.text.y = element_text( margin = margin(l = 7)),
      # legend
      legend.position = "top",
      legend.background = element_blank(),
      legend.key = element_blank(),
      legend.title = element_text(size = 12, colour = "#757575"),
      legend.text.align = 0,
      legend.text = element_text(size = 14, colour = "#757575"),
      # facetting
      strip.background = element_rect(fill = "transparent", colour = NA),
      strip.text = element_text(size = 12, face = "bold", colour = "#757575", hjust = 0)
    )
}

theme_set(theme_lab())

# Import Data
RTT_data <- read.csv("RTT_Data.csv")
Month <- RTT_data$Month
RTT_data <- subset(RTT_data, select = -c(1))
RTT_data <- mutate_all(RTT_data, function(x) as.numeric(as.character(x)))

RTT_data$Month <- as.Date(Month, format = "%d/%m/%Y")

num_above_target = RTT_data$total_waiting - RTT_data$within_18
RTT_data$num_above_target = num_above_target

pre_covid <- filter(RTT_data, post_covid == 0)
  
post_covid <- filter(RTT_data, post_covid == 1)

RTT_2024 <- read.csv("RTT_2024_2.csv")
region_code <- RTT_2024$Region.Code
region_name <- RTT_2024$Region.Name
specialty <- RTT_2024$Treatment.Function
RTT_2024 <- subset(RTT_2024, select = -c(1, 2, 3))
RTT_2024 <- mutate_all(RTT_2024, function(x) as.numeric(as.character(x)))
RTT_2024$region_code <- region_code
RTT_2024$region_name <- region_name
RTT_2024$specialty <- specialty
