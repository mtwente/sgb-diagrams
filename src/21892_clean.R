# Packages -------------------

library(here)
library(readxl)
library(dplyr)

# Read Data --------

data21892 <- read_excel(here("data", "raw", "21892_Data_raw.xlsx"))

data21892 <- data21892[,6:7]
data21892 <- data21892[-1,]

colnames(data21892) <- c("Jahr", "Öffentliches Personal pro 1000 EW")

data21892 <- data21892 %>% mutate_if(is.character, as.numeric)

write.csv(data21892, here("data", "clean", "21892_Data_processed.csv"),
          row.names = FALSE)