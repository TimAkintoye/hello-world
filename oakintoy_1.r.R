

O<- read.csv("RidingMowers.csv")

summary(O)
summary(O$Lot_Size)

mean(O$Income)
median(O$Income)
sd(O$Income)
max(O$Lot_Size)
min(O$Income)
str(O)
tail(O)
IQR(O$Income)


boxplot(O$Income)
hist(O$Lot_Size)
counts <- table(O$Ownership)
pie(counts)
summary(O$Income)


install.packages("caret")
Library(caret)

order(O$Income)
O[c(22,16,21,18),]

O[c(6,7,10,5,2),]