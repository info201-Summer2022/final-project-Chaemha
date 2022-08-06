library(dplyr)

colors = c("green", "orange", "brown")
race <- c("Hispanic", "Non-Hispanic")
education <- c("High-School", "Associate", "Bachelors")

Values <- matrix(c(7553, 5348, 1007, 1520, 998, 1306),
                 nrow = 3, ncol = 2, byrow = TRUE)

barplot(Values, main = "COVID-19 Deaths by Race and Educational Attainment", names.arg = race, 
        xlab = "Race", ylab = "COVID-19 Death Rate", col = colors)

legend("topleft", education, cex = 0.7, fill = colors)


