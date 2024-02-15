# Packages ---------

library(here)
library(ggplot2)
library(ggpubr)

# Settings ---------

plot_settings <- commandArgs(trailingOnly = FALSE)

plot_id <- paste0("plot",plot_settings[[1]])
colormodel_vector <- plot_settings[[2]]
file_format <- plot_settings[[3]]
legend_position <- plot_settings[[4]]

if (!(plot_settings[[2]] == "cmyk" | plot_settings[[2]] == "srgb")) {
  colormodel_vector <- "cmyk"
}

# Source Plot ---------

source(here("src", "21892_plot.R"))

# Export -----------

if (legend_position == "separate-legend") {

  separate_legend <- get_legend(plot21892) |>
    as_ggplot()

  pdf(file = here("build", "21892_separate_Legend.pdf"),
      bg = "transparent",
      colormodel = colormodel_vector)
  print(separate_legend)
  dev.off()
  
  plot21892 <- plot21892 +
    theme(legend.position = "none")
  
  pdf(file = here("build", "21892_separate_Plot.pdf"),
      bg = "transparent",
      colormodel = colormodel_vector)
  print(plot21892)
  dev.off()
  
} else {
  
  plot21892 <- plot21892 +
    theme(legend.position = "bottom")
  
  pdf(file = here("build", "21892_Plot.pdf"),
      bg = "transparent",
      colormodel = colormodel_vector)
  print(plot21892)
  dev.off()
}