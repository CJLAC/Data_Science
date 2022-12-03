library(dplyr)
library(ggplot2)
install.packages("ggplot2")

# 1. How many columns are in mpg dataset? How about the number of rows? Show the codes and its result.
data(mpg)
mpg_data <- glimpse(mpg)
mpg_data 
nrow(mpg)
ncol(mpg)
# The mpg data set have 11 columns and 234 rows. 

#2. Which manufacturer has the most models in this data set? 
most_mods <- mpg_data %>% group_by(manufacturer) %>% count()
most_mods
colnames(most_mods) <- c("Manufacturer","Counts")
most_mods
#  Dodge has the most number of models. It has 37 models.

#Which model has the most variations?
most_var<- mpg_data %>% group_by(model) %>% count()
most_var
colnames(most_var) <- c("Model","Counts")
most_var
# Caravan 2wd model has the most variations. It has 11 variations.

#a. Group the manufacturers and find the unique models. Copy the codes and result.
unique_mods<- mpg_data %>% group_by(manufacturer, model) %>% distinct() %>% count()
unique_mods
colnames(unique_mods) <- c("Manufacturer", "Model","Counts")
unique_mods

#b. Graph the result by using plot() and ggplot(). Write the codes and its result.
plot(unique_mods)
ggplot(unique_mods, aes(x = Model, y = Counts )) + geom_point(color='black')


#3. Same dataset will be used. You are going to show the relationship of the model 
#and the manufacturer.
ggplot(unique_mods, aes(x = Model, y = Manufacturer )) + geom_point(color='black')

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
ggplot(mpg, aes(model, manufacturer)) + geom_point()
# It displays a plot with black points.

# b. For you, is it useful? If not, how could you modify the data to make it more informative?
# Yes, it is helpful since you can trace down the data for each model from the manufacturers.


#4. Using the pipe (%>%), group the model and get the number of cars per model.
# Show codes and its result.
car_mods <- mpg_data %>% group_by(model) %>% count()
car_mods
colnames(car_mods) <- c("Model","Counts")
car_mods

#a. Plot using the geom_bar() + coord_flip() just like what is shown below.
#Show codes and its result.
bar_graph <- ggplot(carsModel, aes( x = Model, y = Counts, fill = Model)) + 
  labs(title = "Numbers of cars per Model", y = "Number of Cars", x = "Model")  +
  geom_bar(stat = "identity") + theme(legend.position = "none")
bar_graph +
  coord_flip()

# b. Use only the top 20 observations. Show code and results.
head(car_mods, n = 20)


#5. Plot the relationship between cyl - number of cylinders and displ - engine displacement 
#using geom_point with aesthetic colour = engine displacement. Title should be
#“Relationship between No. of Cylinders and Engine Displacement”.
#a. Show the codes and its result.
qplot(model,data = mpg,main = "Number of Cars per Model", xlab = "Model",
      ylab = "Number of Cars", geom = "bar", fill = manufacturer) + coord_flip()

#b. How would you describe its relationship?
# Based on the output of the code, I can say that their connection is very consistent or stable.


#6. Get the total number of observations for drv - type of drive train (f = front-wheel drive,
# r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.).
#Plot using the geom_tile() where the number of observations for class be used as a fill for aesthetics.

ggplot(data = mpg_data, mapping = aes(x = drv, y = class)) +
  geom_tile(aes(fill=class))

#a. Show the codes and its result for the narrative in #6.
ggplot(mpg, aes(drv, class)) +
  geom_tile (aes(fill = class)) 

#b. Interpret the result.
# The mapping geometric point graph is used to "map" the black areas.
# The output shows that if there is a relationship between a class and drv, a tile is created. 


#7. Discuss the difference between these codes. Its outputs for each are shown below.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

# The "colour = blue" code in the first code was inside the function aes(), so it failed to add 
# black dots or points. The second code, on the other hand, was performed and was in its right 
# location or outside the aes() method, and the plot was shown accordingly.


#8. Try to run the command ?mpg. What is the result of this command?
?mpg
# It shows "Fuel economy data from 1999 to 2008 for 38 popular models of cars" in the help panel.

#a. Which variables from mpg data set are categorical?
#Categorical variables in mpg include: manufacturer, model, trans (type of transmission), 
#drv (front-wheel drive, rear-wheel, 4wd), fi (fuel type), and class (type of car).

#b. Which are continuous variables?
#Continuous variables in mpg include: displ (engine displacement in litres), cyl 
#(number of cylinders), cty (city miles/gallon), and hwy (highway gallons/mile)

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles
# per gallon). Mapped it with a continuous variable you have identified in 5-b. 
# What is its result? Why it produced such output?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, col = displ)) 


#9. Plot the relationship between displ (engine displacement) and hwy(highway miles
# per gallon) using geom_point(). Add a trend line over the existing plot using
# geom_smooth() with se = FALSE. Default method is “loess”.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=displ)) +
  geom_smooth(se =FALSE)


#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set the
# se = FALSE to remove the confidence interval and method = lm to check for linear modeling.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=displ)) +
  geom_smooth(se =FALSE,method = lm)
