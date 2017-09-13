
head(iris)

lg_iris = log(iris[,1:4])
species_Iris= iris[,5]

apply(lg_iris,2,var)

pca = prcomp(lg_iris, center = TRUE, scale. = TRUE)

pca

plot(pca, type ="l")

pca$rotation= -pca$rotation
pca$x=-pca$x
biplot(pca)