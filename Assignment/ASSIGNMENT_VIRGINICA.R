#CAHUYA BSIT 2A
IRISdata <- data.frame(iris)
IRISdata

IRISdata[IRISdata$Species == 'virginica' ,]

subset <- subset(IRISdata, Species == 'virginica' )
subset


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

mean(mean_virginica)