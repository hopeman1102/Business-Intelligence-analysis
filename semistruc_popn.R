#scrapping tabular data from Wikipedia into a dataframe
library(htmltab)
url <- "https://en.wikipedia.org/wiki/List_of_Irish_counties_by_population"

data <- htmltab(doc=url, which=1)
summary(data)
rownames(data) = c(1:37)
data = data[-c(36:37),]

#data$Population = as.numeric(as.character(data$population))
#class(data$Population)
str(data)

#removing commas from measure data and converting to numeric
data$Population = gsub(",",'\\',data$Population)
data$Population = as.numeric(data$Population)

class(data$Population) 

#merging the values of certain rows and removing unrequired columns
data[1,3] = data[1,3]+data[5,3]+data[6,3]+data[10,3]
data = data[,-c(4,1)]
data = data[-c(5,6,10),]

#scanning Northern Ireland county data and removing those rows as it is unrequired
names=c('Tyrone','Down','Antrim','Londonderry','Fermanagh','Armagh')

#data = data[-match(names,data$`Administrative county`), ]
data = data[ !data$`Administrative county` %in% names, ]
rownames(data)= c(1:26)
data = data[,-c(4)]

#writing the cleaned semi structured data to a csv file
write.csv(data,file = '/Users/Raghav/Desktop/RxM/MSCDAD_JAN18_B/Semester 1/DWBI (H9DW)/Assessment/Project/semistruc_popn.csv')