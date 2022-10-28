#CAHUYA BSIT 2A
IRISdata <- data.frame(iris)
IRISdata

IRISdata[IRISdata$Species == 'versicolor' ,]

subset <- subset(IRISdata, Species == 'versicolor' )
subset

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

mean(mean_versicolor)