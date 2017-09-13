
library(neuralnet)
setwd("I:/HSE/HSE/Big Data Systems/Advanced Data Analysis&Big Data for Business Intelligence/neural network")
# import dataset
data_set= read.csv("data.csv", sep=",", dec=",", header=T)

colnames(data_set)<-c("Date", "Euro")

#View(data_set$Euro)

data_euro = as.numeric( gsub(" , ", " . " , data_set$Euro) )
#View(data_euro)

train = cbind(data_euro[1:700],data_euro[2:701],data_euro[3:702],data_euro[4:703],
             data_euro[5:704],data_euro[6:705])
colnames(train)<-c("V1","V2","V3","V4","V5","V6" )
test = cbind(data_euro[500:600],data_euro[501:601],data_euro[502:602],data_euro[503:603],
              data_euro[504:604],data_euro[505:605])

nn = neuralnet(V1~V2+V3+V4+V5+V6, data = train, hidden=10, threshold=0.01, stepmax=1e6)


plot(nn)
prediction(nn)






