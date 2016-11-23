corr<- function(directory,threshold=0) {
    x<-data.frame()
    correlation<- NULL
    temp_files<- list.files(directory,pattern=".csv",full.names = TRUE)
    
    for(i in seq(length(temp_files))){
        temp <- lapply(temp_files[i], fread, sep=",")
        data<-rbindlist(temp)
        data <-na.omit(data)
    if(nrow(data)>threshold){
      n<-subset(data,select=nitrate)
      s<-subset(data,select=sulfate)
        correlation <- c(correlation,cor(s,n))
      
      }
    }
    
    return(correlation)
}