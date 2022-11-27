#1. The table shows the enrollment of BS in Computer Science, SY 2010-2011

#a. Plot the data using a bar graph. Write the codes and copy the result.
students <- c( 80 , 75, 70, 60)
school_year<- c("1st", "2nd", "3rd", "4th")

barplot( students,
         names.arg =  school_year)

#b. Using the same table, label the barchart with Title = ” Enrollment of BS Computer
#Science, horizontal axis = “Curriculum Year” and vertical axis = “number of students”
barplot(students,
        main = "Enrollment of BS Computer Science",
        names.arg = school_year,
        xlab = "Curriculum Year",
        ylab = "Number of Students", 
        border = "black",
        col = "pink"
)
#2. The monthly income of De Jesus family was spent on the following:
#60% on Food, 10% on electricity, 5% for savings, and
#25% for other miscellaneous expenses.

#a. Create a table for the above scenario. Write the codes and its result.
family_income <- data.frame(
  family_expenses = c("Food", "Electricity", "Savings", "Miscellaneous"),
  rates = c( 60, 10, 5, 25)
)
family_income
data_income <- table(family_income)
data_income

#b. Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.
rates = c( 60, 10, 5, 25)
data1 <- round(rates/sum(rates)*100,1)
data1 <- paste(data1, "%", sep = " ")

plotChart <- pie( rates, 
                  labels = data1, 
                  cex = 0.8, 
                  col = rainbow(4), 
                  main = "De Jesus family Monthly Expenses")

legend("topright", c("Food", "Electricity", "Savings", "Miscellaneous"),
       cex = 0.8 , 
       fill =rainbow(4))


#3. Open the mtcars dataset.
data("mtcars")

#a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#Use $ to select the mpg only. Write the codes and its result.
car_mpg <- (mtcars$mpg)
car_mpg

#b. Colored histogram with different number of bins.hist(mtcars$mpg, breaks=12, col="red")
#Note: breaks= controls the number of bins
hist(car_mpg, breaks=12, col="red")

#c. Add a Normal Curve.Copy the result.
histoCurve <- car_mpg

h<-hist(histoCurve, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")

xfit<-seq(min(histoCurve),max(histoCurve),length=40)
yfit<-dnorm(xfit,mean=mean(histoCurve),sd=sd(histoCurve))
yfit <- yfit*diff(h$mids[1:2])*length(histoCurve)

lines(xfit, yfit, col="blue", lwd=2)


#4. Open the iris dataset. Create a subset for each species.

#a. Write the codes and its result.
data(iris)
iris_data <- data.frame(iris)
iris_data

virgi_Subset <- subset(iris, Species == 'virginica')
virgi_Subset

seto_Subset <- subset(iris, Species == 'setosa')
seto_Subset

versi_Subset <- subset(iris, Species == 'versicolor')
versi_Subset

#b. Get the mean for every characteristics of each species using colMeans().
#Write the codes and its result.
#Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])

virginica <- colMeans(virgi_Subset[sapply(virgi_Subset,is.numeric)])
virginica 

setosa <- colMeans(seto_Subset[sapply(seto_Subset,is.numeric)])
setosa 

versicolor <- colMeans(versi_Subset[sapply(versi_Subset,is.numeric)])
versicolor

#c. Combine all species by using rbind()
#The table should be look like this:
iris_data <- rbind( setosa, versicolor, virginica)
total_data <- data.frame(iris_data)
total_data

#d. From the data in 4-c: Create the barplot().
#Write the codes and its result.The barplot should be like this.

barplot(height = as.matrix(total_data),
        main = "Iris Data",
        ylab = "Mean Scores", 
        xlab = "Characteristics",
        beside =TRUE, col = rainbow(3)
)

