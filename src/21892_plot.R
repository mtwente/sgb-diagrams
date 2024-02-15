# Packages -------------------

library(here)
library(ggplot2)
library(ggpubr)
library(dplyr)
library(scales)

# Functions ------------------

source(here("src", "functions", "Format_Theme.R"))
source(here("src", "functions", "Format_Achsenbeschriftung.R"))

# Read Data ------------------

data21892 <- read.csv(here("data", "clean", "21892_Data_processed.csv"))
colnames(data21892) <- c("Jahr", "Öffentliches Personal pro 1000 EW")

# Plot -----------------------

plot21892 <- ggplot(data = data21892, aes(x = Jahr,
                                          y = `Öffentliches Personal pro 1000 EW`)) +
  
  geom_line(aes(color = "#6195CF"),
            linewidth = 0.561) +
  
  scale_x_continuous(
    breaks = c(1912, 1920, 1930, 1940, 1950, 1963),
    limits = c(1912, 1963),
    guide = guide_axis(),
    expand = expansion(mult = c(0, 0.005)),
  ) +

  scale_y_continuous(
    limits = c(25, 50),
    breaks = seq(0, 50, by = 5),
    expand = expansion(mult = c(0, 0)),
  ) +
  
  scale_color_identity(
    labels = c("Öffentliches Personal pro 1000 Einwohner:innen"),
    guide = "legend"
  ) +
  
  coord_cartesian(clip = "off") + 
  
  theme_sgb_basis() +
  theme(
    legend.position = "bottom"
    )