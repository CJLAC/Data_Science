#CAHUYA BSIT 2A
IRISdata <- data.frame(iris)
IRISdata

IRISdata[IRISdata$Species == 'setosa' ,]

subset <- subset(IRISdata, Species == 'setosa' )
subset

set_sep_L <- iris$Sepal.Length[1:50]
set_sep_L

set_sep_W <- iris$Sepal.Width[1:50]
set_sep_W

set_pet_L2 <- iris$Petal.Length[1:50]
set_pet_L2

set_pet_W2 <- iris$Petal.Width[1:50]
set_pet_W2

mean_setosa <- c(set_sep_L, set_sep_W, set_pet_L2, set_pet_W2)
mean_setosa

mean(mean_setosa)

