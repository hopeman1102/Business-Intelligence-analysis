
#Opening CSV file
cleanse = read.csv("garda_stations_modified.csv")

#Cleaning column to remove the term 'Division' from County names
cleanse$Divisions = gsub("Division",'\\',cleanse$Divisions)

#Saving to new CSV
write.csv(cleanse,file = "garda_abc.csv")
