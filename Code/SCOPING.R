
View(ProgramOutput)

install.packages("tidygeocoder")
library(tidygeocoder)
library(dplyr)


ProgramOutput<-read.csv("FILEPATH")

head(ProgramOutput)
head(ProgramOutput$RESIDENTIAL_ADDRESS1)
head(ProgramOutput$FULL.ADDRESS)
View(ProgramOutput)

max(ProgramOutput$HOUSEHOLD.SCORE)
min(ProgramOutput$HOUSEHOLD.SCORE)

?tidygeocoder



nrow(ProgramOutput)
rowC<-nrow(ProgramOutput)
batch<-4000

r <- rep(1:ceiling(rowC/batch), each=batch)[1:rowC]
d<-split(ProgramOutput,r)


d[[1]]<-d[[1]] %>%
  geocode(FULL.ADDRESS, method='census', lat = 'latitude', long = 'longitude')

View(d[[1]])
View(d[[2]])

result<-list()

?geocode

for (i in seq_along(d)){
    d[[i]] <- geocode(d[[i]], FULL.ADDRESS, method='census', lat = 'Latitude', long = 'longitude')
}



View(d[[1]])
View(d[[2]])
View(d[[3]])

##############

#newer

##############

(ProgramOutput %>%
    mutate(index))

ProgramPrepped<-ProgramOutput
ProgramPrepped[,c('Latitude','Longitude')] = NA



View(ProgramPrepped)

nrow(ProgramPrepped)
rowC<-nrow(ProgramPrepped)
batch<-4000

r <- rep(1:ceiling(rowC/batch), each=batch)[1:rowC]
d<-split(ProgramPrepped,r)

appendedOutput <- data.frame()


for (i in d){
  x<-as.data.frame(d$i)
  appendedOutput<- x %>%
    geocode(FULL.ADDRESS, method='census', long = 'Latitude', long = 'longitude')
}




TEST<-d[[1]] %>%
  geocode(FULL.ADDRESS, method='census', lat = 'latitude', long = 'longitude')
View(TEST$latitude)
View(TEST)
View(appendedOutput)

geocode(d$1)

##################

#old
#############

View(d)
View(d[1])
View(d[3])
View(d[1][["1"]])
View(d[2][["2"]])


length(d)

appendedOutput <- data.frame()
print(d)
for (i in d){
  print(i)
}

for (i in d){
  x<-i
  xx<-d[x][[str(x)]]
  appendedOutput<- x %>%
    geocode(FULL.ADDRESS, method='census', lat = latitude, long = longitude)
}

View(appendedOutput)

#ProgramOutput %>%
#  mutate(index=rep(1:ngrps, each=full_number)[seq(.data)]) %>%
#  group_by(index) %>% mutate(summarize, do())






appendedOutput<- ProgramOutput %>%
  geocode(FULL.ADDRESS, method='census', lat = latitude, long = longitude)

View(d)
d[1]
View(d[2])

View(d[[1]])



#######################

n<-nrow(ProgramOutput)
batch<-10000

n/batch
r <- rep(1:ceiling(n/batch), each=batch)[1:rowC]



trying <-group_by(ProgramOutput, r)

View(trying)
trying



library(data.table)

attempt<-ProgramOutput %>% 
  mutate(index=rep(1:n_groups(each=full)[seq(.data)])) %>% 
  group_by(index)
    