#' Formats raw html into matrix
#'
#'Format a rough dataframe with location data into final form. Removes names and punctuation to leave only location values.
#'@param df datafram producted by the \code{\link{cleanhtml}} function
#'@return dataframe
formatdata<- function(df){

  if(is.null(df)){
    return(NULL)
  } else{

  df[,1]<- gsub("latitude:\\s*","",df[,1], perl=T)
  df[,2]<- gsub("longitude:\\s*","",df[,2], perl=T)
  df[,4]<- gsub("addressString:\\s*","",df[,4], perl=T)
  df[,4]<- gsub("<br/>",",",df[,4], perl=T)
  df[,4]<- gsub("([A-Z]{2})-([0-9]{5})","\\1,\\2",df[,4])
  df[,4]<- gsub("\\\"","",df[,4])
  dat3<- cbind(df[,1:2],
               matrix(unlist(strsplit(df[,4],",")),byrow=T, ncol=4))
  dat3[,1]<- as.numeric(dat3[,1])
  dat3[,2]<- as.numeric(dat3[,2])
  names(dat3)<- c("lat","long","street", "city","state","zipcode")
  }
  dat3
}

