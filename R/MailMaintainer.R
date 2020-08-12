

rdm<-revdep_maintainers()

library(stringi)
library(data.table)

maint<-data.table(stri_split_regex(rdm,"<",simplify = T))

names(maint)<-c("Maintainer","Email")

maint[,Maintainer:=stri_replace_all_regex(Maintainer," $","")]
maint[,Maintainer:=stri_replace_all_fixed(Maintainer,"'","")]

maint[,Email:=stri_replace_all_regex(Email,">$","")]

