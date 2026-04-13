library(tidyverse)
library(janitor)
library(palmerpenguins)

data("penguins")
penguins_raw2 <- clean_names(penguins)

# summarize data per species and island
penguins_raw2 %>% 
  mutate(across(c(species, island), factor)) %>% 
  group_by(species, island) %>%
  count() %>% 
  ungroup()

penguins_raw2 %>% 
  group_by(species, sex) %>% 
  count()

penguins_raw2 %>% 
  group_by(species) %>% 
  summarize(
    mean_mass = mean(body_mass_g, na.rm = TRUE),
    sd_mass = sd(body_mass_g, na.rm = TRUE), 
    max_mass = max(body_mass_g, na.rm = TRUE),
    min_mass = min(body_mass_g, na.rm = TRUE)
  )
