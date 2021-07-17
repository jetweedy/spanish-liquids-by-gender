
library(ggplot2)

data <- read.csv('liquids_data.csv');
ldata <- data[data$phoneme=="l", ]
rdata <- data[data$phoneme=="r", ]
lCounts <- table(ldata$sex, ldata$type2);
rCounts <- table(rdata$sex, rdata$type2);
lPct = round(prop.table(lCounts, margin=1), 2);
rPct = round(prop.table(rCounts, margin=1), 2);



ldata <- as.data.frame(lPct) 
names(ldata)[1] = "Sex"
names(ldata)[2] = "Expression"
names(ldata)[3] = "Percent"
ggplot(data=ldata, aes(fill=Sex, x=Expression, y=Percent)) + geom_bar(position="dodge", stat="identity") + 
  ggtitle("Expressions of Liquid /l/ by Gender") + 
  scale_y_continuous(labels = scales::percent, limits=c(0,1)) + 
  scale_fill_manual("legend", values = c("f" = "black", "m" = "darkgray")) + 
  ylab("")
rdata <- as.data.frame(rPct) 
names(rdata)[1] = "Sex"
names(rdata)[2] = "Expression"
names(rdata)[3] = "Percent"
ggplot(data=rdata, aes(fill=Sex, x=Expression, y=Percent)) + geom_bar(position="dodge", stat="identity") + 
  ggtitle("Expressions of Liquid /r/ by Gender") + 
  scale_y_continuous(labels = scales::percent, limits=c(0,1)) + 
  scale_fill_manual("legend", values = c("f" = "black", "m" = "darkgray")) + 
  ylab("")



barplot(lCounts, main="Expressions of Liquid /l/ by Gender",
        ylab="%",
        col=c("black","gray"),
        ylim=c(0,100),
        legend = rownames(lCounts), 
        beside=TRUE)
barplot(rCounts, main="Expressions of Liquid /r/ by Gender",
        ylab="%",
        col=c("black","gray"),
        ylim=c(0,100),
        legend = rownames(rCounts), 
        beside=TRUE)





