complete <- function(directory,id=1:332){
  x<-data.frame()
  temp_files<- list.files(directory,pattern=".csv",full.names = TRUE)
  for(i in id){
    files<- temp_files[i]
    temp <- lapply(files, fread, sep=",")
    data<-rbindlist(temp)
    n<-nrow(subset(data,!is.na(data[["sulfate"]]) & !is.na(data[["nitrate"]])))
    x<-rbind(x,data.frame(id=i,nobs=n))
  }
  return(x)
}