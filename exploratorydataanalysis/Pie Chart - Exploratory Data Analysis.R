library(dplyr)

geeks <- c(3807, 1998)
labels <- c("Male", "Female")

piepercent<- round(100 * geeks / sum(geeks), 1)

pie(geeks, labels = piepercent,
    main = "No High School Diploma", col = rainbow(length(geeks)))

legend("topleft", c("Male", "Female"),
       cex = 0.5, fill = rainbow(length(geeks)))



