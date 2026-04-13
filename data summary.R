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

# Violin plot of body mass by species
ggplot(penguins_raw2, aes(x = species, y = body_mass_g, fill = species)) +
  geom_violin(alpha = 0.7) +
  geom_jitter(size = 2, alpha = 0.5, width = 0.1) +
  scale_fill_viridis_d() +
  labs(title = "Distribution of Body Mass by Penguin Species",
       x = "Penguin Species",
       y = "Body Mass (g)") +
  ggeasy::easy_remove_x_axis("title") +
  theme_bw() +
  ggeasy::easy_remove_legend()
