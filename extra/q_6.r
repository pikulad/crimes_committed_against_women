table=read.csv("E:/project/crimes.csv")
rap_crime=table %>% filter(Year==2001) %>% summarise(rap_crime = sum(Rape))
kidnap_crime=table  %>% filter(Year==2001) %>%  summarise(kidnap_crime = sum(Kidnapping.and.Abduction))
dowry_crime=table %>% filter(Year==2001) %>% summarise(dowry_crime = sum(Dowry.Deaths))
assult_crime=table %>% filter(Year==2001) %>% summarise(assult_crime = sum(Assault.on.women.with.intent.to.outrage.her.modesty))
insult_crime=table %>% filter(Year==2001) %>% summarise(insult_crime = sum(Insult.to.modesty.of.Women))
by_rel_crime=table %>% filter(Year==2001) %>% summarise(by_rel_crime = sum(Cruelty.by.Husband.or.his.Relatives))
imp_crime=table %>% filter(Year==2001) %>% summarise(imp_crime = sum(Importation.of.Girls))
all_crimes=c(rap_crime,kidnap_crime,dowry_crime,assult_crime,insult_crime,by_rel_crime,imp_crime)
tr_crimes=as.numeric(paste(all_crimes))
header=c("Rape","Kidnapping.and.Abduction","Dowry.Deaths","Assault.on.women.with.intent.to.outrage.her.modesty","Insult.to.modesty.of.Women","cruelty.by.Husband.or.his.Relatives","Importation.of.Girls")
my_tree=cbind(header,tr_crimes)
df=data.frame(header,tr_crimes)
str(df)
transform(df,all_crimes=as.numeric(all_crimes))
str(df)
print(df)
print(all_crimes)





x <-  df$tr_crimes
labels <-  df$header

piepercent<- round(100*x/sum(x), 1)

# Give the chart file a name.
#png(file = "city_percentage_legends.jpg")

# Plot the chart.
pie(x, labels =paste(df$header,piepercent,"%"), main = "Crime in 2001 pie chart",col = rainbow(length(x)))
legend("topright", df$header, cex = 0.8,fill = rainbow(length(x)))
