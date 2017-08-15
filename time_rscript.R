#time function
timer_begin <- function(x) {
  x[nrow(x)+1,1] <- Sys.time()
  x[nrow(x), 2] <- "begin"
 return(x) 
}

timer_end <- function(x) {
  x[nrow(x)+1,1] <- Sys.time()
  x[nrow(x), 2] <- "end"
  x[nrow(x), 3] <- x[nrow(x),1] - x[nrow(x) - 1, 1]  
  return(x) 
}
library(tidyverse)
setwd("~/Historie projekt/working_time")

#read file

#first 3 house loaded in seconds
timer_da <- read.csv("timer_da.csv") %>% 
  mutate(time = as.POSIXct(time),
         status = as.character(status))


#begin timer
timer_da <- timer_begin(timer_da)
#bend timer
timer_da <- timer_end(timer_da)

#save file

write.csv(timer_da, "timer_da.csv", row.names = F)

#save to git

