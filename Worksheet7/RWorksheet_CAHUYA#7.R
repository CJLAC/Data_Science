install.packages('Hmisc')
install.packages('pastecs')
library(Hmisc)
library(pastecs)



#1. Create a data frame for the table below.

scores <- data.frame(
  Student = seq(1:10),
  Pre_test = c(55, 54, 47, 57, 51, 61, 57, 54, 63, 58),
  post_test = c(61, 60, 56, 63, 56, 63, 59, 56, 62, 61)
)
scores
colnames(scores) <- c("Student", "Pre-test", "Post-test")
scores

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.

dsHmisc <- describe(scores)
dsHmisc
dsPastecs <- stat.desc(scores)
dsPastecs


#2. The Department of Agriculture was studying the effects of several levels of a
#fertilizer on the growth of a plant. For some analyses, it might be useful to convert
#the fertilizer levels to an ordered factor.
#The data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.

#a. Write the codes and describe the result.
data <- c(10,10,10, 20,20,50,10,20,10,50,20,50,20,10)
factor(data)
sort(data, decreasing = FALSE)
#The resulting output displays the various fertilizer levels in an ordered or rising sequence.


#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense

#a. What is the best way to represent this in R?
exer_levels <- c("l", "n", "n", "i", "l", "l", "n", "n", "i", "l")
exer_levels
factor(exer_levels)
# Data.frame is the best way to represent them.


#4. Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonics as:
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")

#a. Apply the factor function and factor level. Describe the results.
factorState <- factor(state)
factorState
factorLevel <- levels(factorState)
factorLevel
#The vector and its levels are shown using the factor() function.
#The levels() function simply displays the different levels or characters that have been utilized.


#5. From #4 - continuation:
# Suppose we have the incomes of the same tax accountants in another vector 
#(in suitably large units of money)
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
incomes
total_data <- data.frame(
  state = c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
            "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
            "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
            "vic", "vic", "act"),
  incomes = c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56, 61, 61,
              61, 58,51, 48,  65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
)
total_data

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
tapply(incomes, state, mean)

#b. Copy the results and interpret.
tapply(incomes, state, mean)
# It shows the vector's levels and their respective means.


#6. Calculate the standard errors of the state income means (refer again to number 3)

#a. What is the standard error? Write the codes.
stdError <- function(x) sqrt(var(x)/length(x))
incster <- tapply(incomes, state, stdError)
incster

#b. Interpret the result.
# The output shows the standard deviation of the sample distribution or an estimate of the SE. 
# It shows the levels as well as the related SD.


#7. Use the titanic dataset.
data("Titanic")
titanic_DF <- as.data.frame(Titanic)
titanic_DF

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.

#survived
survived_sub <- subset(titanic_DF , Survived == 'Yes')
survived_sub

#notsurvived
not_survived_sub <- subset(titanic_DF , Survived == 'No')
not_survived_sub


#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.
library("readxl")
Breast_Cancer <- read_excel("C:/Data_Science/Worksheet7/Breast_Cancer.xlsx")
Breast_Cancer

#a. describe what is the dataset all about.
# The dataset contains information on breast cancer clinical cases such as CL thickness, 
# Cell size, Cell shape, Marg,Adhesion, Epith. C.size, Bare. Nuclei, Bl. Cromatin, 
# Normal nucleoli, Mitoses, and Class.

#b. Import the data from MS Excel. Copy the codes.
Breast_Cancer <- read_excel("C:/Data_Science/Worksheet7/Breast_Cancer.xlsx")
Breast_Cancer

#c. Compute the descriptive statistics using different packages. Find the values of:

#c.1 Standard error of the mean for clump thickness.
standard_clump <- sd(Breast_Cancer$`CL. thickness`/sqrt(length((Breast_Cancer$`CL. thickness`))))
standard_clump

#c.2 Coefficient of variability for Marginal Adhesion.
cv_marg_adhesion <- sd(Breast_Cancer$`Marg. Adhesion`) / mean(Breast_Cancer$`Marg. Adhesion`) * 100
cv_marg_adhesion

#c.3 Number of null values of Bare Nuclei.
num_bare_nuclei <- sum(is.na(Breast_Cancer$`Bare. Nuclei`))
num_bare_nuclei

#c.4 Mean and standard deviation for Bland Chromatin
mean_B_chromatin <- mean(Breast_Cancer$`Bl. Cromatin`)
mean_B_chromatin 

standard_dev_B_chromatin <- sd(Breast_Cancer$`Bl. Cromatin`)
standard_dev_B_chromatin 

#c.5 Confidence interval of the mean for Uniformity of Cell Shape
mean_cell <- mean(Breast_Cancer$`Cell Shape`)
standard_cell <- sd(Breast_Cancer$`Cell Shape`)/sqrt(length(Breast_Cancer$`Cell Shape`))

alpha <- 0.05
dg <- length(Breast_Cancer$`Cell Shape`) - 1

t.score <- qt(p = alpha/2 , df = dg, lower.tail = F)

margin.error <- t.score * standard_cell
lower.bound <- mean_cell - margin.error
upper.bound <- mean_cell + margin.error

CFinterval <- c(lower.bound, upper.bound)
CFinterval

#d. How many attributes?
#NULL

#e. Find the percentage of respondents who are malignant. Interpret the results.
library(dplyr ) 
Breast_Cancer %>%
  group_by(Class) %>% 
  summarise( Percent = 100 * n() / nrow(Breast_Cancer))

#9. Export the data abalone to the Microsoft excel file. Copy the codes.
install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")
data(abalone)
view(abalone)
head(abalone)
summary(abalone)
