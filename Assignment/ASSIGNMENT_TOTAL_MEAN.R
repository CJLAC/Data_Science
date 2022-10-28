#CAHUYA BSIT 2A
IRISdata <- data.frame(iris)
IRISdata

IRISdata[IRISdata$Species == 'versicolor' ,]

subset <- subset(IRISdata, Species == 'versicolor' )
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




ver_sep_L <- iris$Sepal.Length[51:100]
ver_sep_L

ver_sep_W <- iris$Sepal.Width[51:100]
ver_sep_W

ver_pet_L2 <- iris$Petal.Length[51:100]
ver_pet_L2

ver_pet_W2 <- iris$Petal.Width[51:100]
ver_pet_W2

mean_versicolor <- c(ver_sep_L, ver_sep_W, ver_pet_L2, ver_pet_W2)
mean_versicolor




vir_sep_L <- iris$Sepal.Length[101:150]
vir_sep_L

vir_sep_W <- iris$Sepal.Width[101:150]
vir_sep_W

vir_pet_L2 <- iris$Petal.Length[101:150]
vir_pet_L2

vir_pet_W2 <- iris$Petal.Width[101:150]
vir_pet_W2

mean_virginica <- c(vir_sep_L, vir_sep_W, vir_pet_L2, vir_pet_W2)
mean_virginica





total_mean <- c(mean_setosa, mean_versicolor, mean_virginica)
total_mean

mean(total_mean)