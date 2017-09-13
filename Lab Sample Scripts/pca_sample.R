
data(crimtab)
head(crimtab)
colnames(crimtab)
dim(crimtab)
str(crimtab)

apply(crimtab,2,var)

pcacrim= prcomp(crimtab)
pcacrim
 par(mar=rep(2,4))
 
 plot(pcacrim, type = "l")
 #better visuliziling
 pca$rotation= -pca$rotation
 pca$x= -pca$x
 biplot(pca, scale = 0)
 
 crimtab[16:17,9]
 crimtab[17:18,9]
 