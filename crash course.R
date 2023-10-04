
ages <- c(13, 11, 10)


sum(ages)

print(ages)



names <- c("Angharad", "Gareth", "Alex")

siblings.data <- data.frame(names, ages)
View(siblings)
str(siblings)
## str is short for structure 

siblings$ages
siblings$names

## you dont have to download tidyverse every time, but you do need to call it out of the library via library()
## to be able to access functions like %>%  and whatnot.

library(tidyverse)

#(built in data sets to practice with)
data()
View(women)

#%>% = pipe operator, you can type it out normally or use shift, ctrl + m as a shortcut 
## it basiclaly means 'and then...' so it takes what was just written and continues it onto the next line. 
women %>% 
  ## filter = filter the data (eg. below is to filter the set by height above 150cm and weight below 130)
  filter(weight < 130) %>% 
  ## mutate = to create a variable to a data frame while preserving any exisiting variables.
  ## In this case, to change cm into ft, you divide it by 30.48 (thx google) therefore creating a new variable 
  ## called height in metres :)
  mutate(height_in_metres = height/30.48) %>% 
  ## select = this is how you tell R what variables you want to work with
  select(height_in_metres, weight) %>% 
  ##arrange = how you want to sort the data - smallest to biggest is default, but if you were to write
  ## " -Weight" instead, it would do it biggest to smallest. 
  arrange(weight) %>% 
  ## View = always upper case V!
  #View()    ## remove the # to use - for some reason you can only use one at a time?
  
  plot()

########################################### DATA STRUCTURE ################################################
View(msleep)
## glimpse - good way to get a quick overview of the dataset at hand. 
glimpse(msleep) 
## Head - provides first 6 rows
head(msleep)
## class - provides the type
## $name - provides you the variable you are looking at within the dataset - eg. class(msleep$name) gives you 
##the class of the name variable (in this case, character)
class(msleep$name)
##length - the number of variables
length(msleep)
## length(msleep$name) - how many observations of that variable there are 
length(msleep$name) 
## names - all of the names of the variables
names(msleep)
##unique(msleep$genus) - will bring up all the sub-categories of variable, in this case all the genuses
unique(msleep$genus)
##missing <- !complete.cases(msleep) - complete.cases() is a function 
## that removes missing values in a vector, matrix, or data frame. if you do !complete.cases, it does the opposite!
## if you then asign this to an object called something sensible like 'missing', you now have an object
## that contains every row that is missing :)
missing <- !complete.cases(msleep)
  print(missing)
    msleep[missing, ] ## <- do this to call up all the missing data :) google square brackets(try https://www.dataanalytics.org.uk/r-object-elements-brackets-double-brackets-and/ ) 
    ## I cant be arsed type it all x sorry future me xx