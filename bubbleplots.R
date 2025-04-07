library(dplyr)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(ggExtra)
# Import the penguins dataset using the read.csv() function, built into R
penguins <- read.csv("penguins_size.csv")

penguins[c('species', 'island', 'sex')] <- lapply(penguins[c('species', 'island', 'sex')], as.factor)

penguins <- penguins |> na.omit() |> rename('Island' = 'island', 'Species' = 'species', 'Sex' = 'sex') |> filter(!(Sex == "."))
penguins <- na.omit(penguins)

penguins |>
  ggplot(aes(x = culmen_length_mm, y = culmen_depth_mm, colour = "#FF4F00", size = flipper_length_mm))+
  geom_point(shape = 16, alpha = 0.4)+
  labs(x = "Culmen Length (mm)", y = "Culmen Depth (mm)", title = "Culmen Length vs. Depth \n in Penguins in the Palmer Archipelago") +
  geom_smooth(method="lm")+
  theme_hc()


penguins |>
  arrange(desc(body_mass_g)) |>
  ggplot(aes(x = culmen_length_mm, y = culmen_depth_mm, colour = "#FF4F00", size = body_mass_g))+
  geom_point(shape = 16, alpha = 0.5)+
  labs(x = "Culmen Length (mm)", y = "Culmen Depth (mm)", title = "Culmen Length vs. Depth \n in Penguins in the Palmer Archipelago") +
  geom_smooth(method="lm")+
  theme_hc()



penguins |>
  arrange(desc(flipper_length_mm)) |>
  ggplot(aes(x = culmen_length_mm, y = culmen_depth_mm, colour = Species, size = flipper_length_mm))+
  geom_point(shape = 16, alpha = 0.35)+
  labs(x = "Culmen Length (mm)", y = "Culmen Depth (mm)", title = "Culmen Length vs. Depth \n in Penguins in the Palmer Archipelago") +
  geom_smooth(method="lm")+
  theme_hc()
