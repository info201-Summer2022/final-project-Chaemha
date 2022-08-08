library(dplyr)
library(stringr)

selected <- select(X2015, '...2')
filtered <- selected %>% filter(...2 > 1000)


