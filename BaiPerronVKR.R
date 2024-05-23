install.packages("forecast")
library("forecast")
install.packages("lmtest")
library("lmtest")
install.packages("tseries")
library("tseries")
install.packages("vars")
library("vars")
install.packages("urca")
library("urca")
install.packages("TSA")
library("TSA")
install.packages("strucchange")
library("strucchange")

library("readxl")
my_data <- read_excel("corrected_series.xlsx", sheet = 1)

data <- my_data[2:23]

#data$India_199 <- as.numeric(data$India_199)


for (col_name in colnames(data)) {
  
  print("=================================================================")
  print(col_name)
  
  d0<-data[[col_name]]
  d1<-diff(d0, differences=1)
  
  d1<-ts(d1, start=1)
  d1_l1 <- c(0,d1[1:length(d1)-1])
  stat <- breakpoints(d1 ~ d1_l1)
  print(summary(stat))
  print(plot(stat))

}


