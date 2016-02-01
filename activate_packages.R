#activate multiple r packages

my_packages <- c("ggplot2", "psych", "plyr", "e1071", "rpart", "data.table")

lapply(my_packages, require, character.only = T)
