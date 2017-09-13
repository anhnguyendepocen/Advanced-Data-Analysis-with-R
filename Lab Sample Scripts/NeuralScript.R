setwd("C:/Users/student/Desktop/hw")
library(neuralnet)

data <- data.frame(seq(1:10), c(1:10)^2)
colnames(data) <- c("V", "V2")

#neural net ~ V + V1 + V2.. dependend variables
#threshold - criteria for stopping
nn <- neuralnet(V2 ~ V, data = data,  hidden = 10, threshold = 0.0001, stepmax = 1e6, rep = 5)
plot(nn)

prediction(nn)





#------------------------------------------------------------------------------
data <- read.csv('datann.csv', sep=";")
colnames(data) <- c("date", "curr")
data$curr <- as.numeric(gsub(",",".",data$curr))
data$date <- strptime(data$date, "%d.%m.%Y %H:%M")
#data0 <- data
#data$date <- as.character(data$date)

plot(data$curr,type="l")
#train.data <- data[1:800,2]
#test.data <- data[801:1000,2]

rm(test)
test <- cbind(data$curr[1:500], data$curr[2:501], data$curr[3:502], data$curr[4:503], data$curr[5:504], data$curr[6:505])

nn <- neuralnet(V1 ~ V2 + V3 + V4 + V5 + V6, data = test,  hidden = 10, threshold = 0.0001, stepmax = 1e6, rep = 1)
plot(nn)

#predict for itself.
pr <- as.data.frame(prediction(nn))
test <- as.data.frame(test)


plot(pr$rep1.V1, col="red",type="l")
par(new=TRUE)
plot(test$V1, col="green",type="l")

#compute for random data
#com <- compute(nn, test[,2:6])$net.result
#par(new=TRUE)
#plot(com, col="blue",type="l")


