#1. Create a vector using : operator
#1.a. Sequence from -5 to 5. Write the R code and its output.Describe its output.
x <- -5:5
x
#OUTPUT: [1] -5 -4 -3 -2 -1  0  1  2  3  4  5
#It displays the numbers from -5 to 5. It also displays the 0 in between the negative and positive numbers.

#1.b. x <- 1:7. What will be the value of x?
x <- 1:7
x


#2.* Create a vector using seq() function
#a. seq(1, 3, by=0.2) #specify step size - specifies that in every number you have to go to the next one by a 0.2 difference..
#Write the R code and its output.Describe its output.
seq(1, 3, by=0.2)
#OUTPUT: [1] 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0
#The output displays the sequence of numbers from 1.0 until 3.0 with the difference of 0.2


#3 A factory has a census of its workers. There are 50 workers in total. 
#The following list shows their ages: 34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 
#31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
#24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26, 18.
Workers <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
             22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
             24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
             18)
#3.a. Access 3rd element
Workers[3]
#What is the value?
#[1] 22

#3.b. Access 2nd and 4th element, 
Workers[2]
Workers[4]
#What are the values?
#[1] 28 36

#3.c. Access all but the 1st element is not included. Write the R code and its output.
removefirst <- Workers[2:50]
removefirst
#OUTPUT:[1] 28 22 36 27 18 52 39 42 29 35 31 27 22 37 34 19 20 57 49 50 37 46 25 17 37 43
#       [27] 53 41 51 35 24 33 41 53 40 18 44 38 41 48 27 39 19 30 61 54 58 26 18


#4.Create a vector x <- c("first"=3, "second"=0, "third"=9).Then named the vector,names(x)
x <- c("first"=3, "second"=0, "third"=9)
names(x)

#4.a. Print the results. 
#[1] "first"  "second" "third" 
#Then access x[c("first", "third")
x[c("first", "third")]

#Describe the output.
#The result shows the "first" and "third" characters horizontally, followed by another row with the values of the characters entered which are 3 and 9.

#4.b. Write the code and its output
#x[c("first", "third")]

#first third 
#    3     9 


#5. Create a sequence x from -3:2.
x <- -3:2
x

#5.a. Modify 2nd element and change it to 0;
x[2] <- 0
x
#Describe the output.
#The second element of sequence x which is -2, modifies or converts the value to 0.

#5.b. Write the code and its output.
#x[2] <- 0
#x
#OUTPUT: [1] -3  0 -1  0  1  2


#6.The following data shows the diesel fuel purchased by Mr. Cruz.
#6.a. Create a data frame for month, price per liter (php) and purchase-quantity (liter). Write the codes.
Month <- c("Jan", "Feb", "March", "Apr", "May", "June")
Price <- c(52.50, 57.25, 60.00, 65.00, 74.25, 54.00)
Quantity <- c(25, 30, 40, 50, 10, 45) 

data_frame <- data.frame(Month, Price, Quantity )
data_frame

#6.b. What is the average fuel expenditure of Mr. Cruz from Jan to June?
weighted.mean(Price, Quantity)


#7.R has actually lots of built-in datasets. For example, the rivers data “gives the lengths (in miles) of 141 “major” rivers in North America, as compiled by the US Geological Survey”.
#7.a. Type “rivers” in your R console. Create a vector data with 7 elements, containing the number of elements (length) in rivers, their sum (sum), mean (mean), median (median), variance (var),standard deviation (sd), minimum (min) and maximum (max).
rivers
data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

#7.b. What are the results?
#[1]    141.0000  83357.0000    591.1844    425.0000 243908.4086    493.8708
#[7]    135.0000   3710.0000

#7.c. Write the code and its outputs.
#rivers
#data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
#          sd(rivers), min(rivers), max(rivers))
#data

#OUTPUT: [1]    141.0000  83357.0000    591.1844    425.0000 243908.4086    493.8708    
#        [7]    135.0000   3710.0000


#8. The table below gives the 25 most powerful celebrities and their annual pay as ranked by the editions of Forbes magazine and as listed on the Forbes.com website.
#8.a. Create vectors according to the above table. Write the codes.
Celeb_mag_data <- data.frame(
  PowerRanking = c(1:25),
  CelebrityName = c("Tom Cruise","Rolling Stones", "Oprah Winfrey","U2",
                    "Tiger Woods","Steven Speilberg","Howarf Stern","50 Cent",
                    "Cast of the sopranos","Dan Brown","Bruce Springsteen",
                    "Donald Trump","Muhammand Ali","Paul McCartney",
                    "George Lucas","Elton John","David Letterman","Phil Mickelson", 
                    "J.K Rowling", "Bradd Pitt","Peter Jackson",
                    "Dr.Phil McGraw","Jay Lenon","Celine Dion","Kobe Bryan"),
  Pay = c(67,90,225,110,90,32,302,41,52,88,55,44,55,40,233,34,40,47,75,25,39,45,32,40,31)
)
Celeb_mag_data

#8.b. Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and pay to 90. Write the codes and its output.
Celeb_mag_data[19,"PowerRanking"] <- 15
Celeb_mag_data[19,"Pay"] <- 90
Celeb_mag_data

#8.c. Interpret the data.
# According to the data, the Power Ranking and Pay of the Celebrity named J.K. Rowling was changed from the power ranking of 19 to 15 and pay of 75 to 90. The table's sequence and categories became disorganized as a result of this. She is still positioned in the 19th place but ranked higher.