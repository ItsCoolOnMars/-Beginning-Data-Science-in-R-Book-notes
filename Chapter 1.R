
#CHAPTER 1

#The pipeline operator %>% introduced in the magrittr package allows you to write functions after 
#functions in easily readble for human form. It simply takes whatever is computed on the leftside of the 
#operator and inserts it as the first argument to the function on the right side of it.
#for a pipeline operator %>% to take the leftside value as not a first argument use . in the place where
#it should be inserted in the function.
#magrittr also gives some other useful pipeline operators like %$% and %T>%

#Exercises:

library(magrittr)

#Mean of Positive Values

x <- rnorm(20)

#Solution 1
x %>% {
  for(i in 1:length(.)){
    if (.[i]<0) .[i] <- NA
  }
  mean(., na.rm = TRUE)
}

#Solution 2
x %>% {.[.>=0]} %>% mean(.)

#Root Mean Square Error
values <- data.frame("t" = rnorm(20), "y" = rnorm(20))

#Solution using pipelines
values %$% {(t-y)^2} %>% mean(.) %>% sqrt(.)

#Solution without pipelines
rmse <- function(x){
  errorsqr <- (x[,1]-x[,2])^2
  sqrt(mean(errorsqr))
}
rmse(values)
