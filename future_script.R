library(waffle)

waffle_data_species <- table(penguins$species)

waffle(waffle_data_species, rows=9)+
  scale_fill_few("Light")+
  labs(fill="Species")+
  theme_hc()

library(waffle)
waffle_data_species <- table(penguins$species)

w_1 <- waffle(waffle_data_species, rows=9, colors=c('blue', 'orange', 'green'))+
  labs(fill="Species")

waffle_data_island <- table(penguins$island)

w_2 <- waffle(waffle_data_island, rows=9, colors = c('yellow','pink','purple'))+
  labs(fill="Island")

waffle_data_sex <- table(penguins$sex)

w_3 <- waffle(waffle_data_sex, rows=9, colors=c('red', 'blue','black'))+
  labs(fill="Sex")

iron(w_1, w_2, w_3)

library(cowplot)
library(tidyr)
library(ggbeeswarm)


library(MASS) 
library(reshape2) 
library(reshape) 

mass_swarm <- 
  ggplot(penguins, aes(species, body_mass_g, color = species)) +
  geom_beeswarm(cex = 2) +
  geom_rangeframe() +
  theme_hc()+
  theme(legend.position="none")

c_length_swarm <-
  ggplot(penguins, aes(species, culmen_length_mm, color = species)) +
  geom_beeswarm(cex = 2) +
  geom_rangeframe() +
  theme_hc()+
  theme(legend.position="none")

c_depth_swarm <-
  ggplot(penguins, aes(species, culmen_depth_mm, color = species)) +
  geom_beeswarm(cex = 2) +
  geom_rangeframe() +
  theme_hc()+
  theme(legend.position="none")

f_length_swarm <-
  ggplot(penguins, aes(species, flipper_length_mm, color = species)) +
  geom_beeswarm(cex = 2) +
  geom_rangeframe() +
  theme_hc()+
  theme(legend.position="none")

plot_grid(mass_swarm, c_length_swarm, c_depth_swarm, f_length_swarm)

```
```{r}

penguin_2 <- melt(penguins, id = c('species', 'island', 'sex'))

ggplot(penguin_2, aes(x=species, y=value, color = species))+
  geom_beeswarm(cex = 3)+
  facet_grid(variable~island, scales="free", space="free_x")+
  theme_hc()

ggplot(penguin_2, aes(x=island, y=value, color = species))+
  geom_boxplot()+
  facet_grid(variable~sex, scales="free", space="free_x")+
  theme_hc()