


pollutantmean<- function(directory,pollutant,id=1:332){
 
      temp_files<- list.files(directory,pattern=".csv",full.names = TRUE)
      files<- temp_files[id]
      temp <- lapply(files, fread, sep=",")
      data<-rbindlist(temp)
      x<-subset(data,!is.na(data[[pollutant]]),select= pollutant)
      return(mean(x[[1]]))

}






