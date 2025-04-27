library(plotly)
library(dplyr)
library(tidyr)
total_medals <- read.csv('data/medals_total.csv')
total_medals$country_code <- factor(total_medals$country_code, levels = unique(total_medals$country_code)[order(total_medals$Total, decreasing = FALSE)])

long_medals <- total_medals |>
  pivot_longer(
    cols = c(Gold.Medal, Silver.Medal, Bronze.Medal, Total),
    names_to = "Medal",
    values_to = "Count"
  )

fig <- long_medals |> 
  filter(Medal != 'Total') |>
    plot_ly(
    y = ~country_code,
    x = ~Count,
    name = ~Medal,
    type = "bar",
    orientation='h',
    color = ~Medal
)

fig
