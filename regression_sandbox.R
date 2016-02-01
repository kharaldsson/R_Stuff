library(ggplot2)
library(dplyr)
library(leaps)
#library(foreign) #arff reader package if necessary

#turn csv into dataframe "df"
df -> read.csv("FILENAMe") #or read.arff()

#filter data based on conditions using dplyr
my_data <- filter(df, column1 < 600000 & column2 = "some selection")

#modify field names
my_data$NewName <- my_data$OldName

#calculate the difference between two date fields. Format argument is based on the format of your date fields
my_data$DateDiff <- as.Date(as.character(my_data$EndDate), format="%m/%d/%Y") - as.Date(as.character(my_data$StartDate), format="%m/%d/%Y")

#if you need to winnow down the fields you pull in, you can either use the data frame column indexes or their names https://www.datacamp.com/community/tutorials/15-easy-solutions-data-frame-problems-r
my_subset <- my_data[Range of Instances, c("column1", #range of instances will show all if left blank before comma
                         "column2",
                         "columnN")]

#variable selection using leaps - regsubsets
leaps = regsubsets(column_depvar ~ ., data=my_subset, nbest=10)
summary(leaps)
plot(leaps, scale="adjr2")

#variable selection using step() (The lower the AIC, the better the model)
null <- lm(Settlement.Amount ~ 1, data=my_subset)
full <- lm(Settlement.Amount ~ ., data=my_subset)
step(null, scope=list(lower=null, upper=full), direction="forward") #forward steps
step(full, data=my_subset, direction="backward") #backward steps

#best variables based on step
my_lm <- lm(column_depvar ~ column1 + 
                column2 + 
                columnN,
              data = my_subset)

summary(my_lm)

#plot histogram of column
qplot(data = my_subset, x = column1, binwidth = 5000) + ylab("Number of Matters") + xlim(c(0,500000))

#plot 
ggplot(my_subset, aes(x = column1, y = column_depvar)) + geom_point(colour = 'red', size = 1) +   
  geom_smooth(method=lm, level=0.95) +
  ylab("column_depvar") +
  xlab("column1")
