#'Extracts the location data from the html string
#'
#'This function takes a raw html string from the gethtml function and extracts the location data.  Each patient lab will include the address, city, state, zip code and lat-long coordinates for their location.
#'@return dataframe
#'@param htmlstring character vector produced by the gethtml function.  The html will be scraped from the LabCorp website.
#'
cleanhtml<- function(htmlstring){
  if(nchar(htmlstring)==0){
    return(NULL)
  } else{

  x<-gsub("&nbsp|\r|\t|\n",'',htmlstring)   # remove extraneous characters
  x<-gsub("^.*results: \\[\\s*", "",x, perl=T)  # remove header text
  x<-gsub("\\s*,\\s*",",",x)  #Collapse spaces around commas
  x<-gsub("\\s*\\{\\s*","\\{",x,perl=T) # remove spaces around brackets
  x<-gsub("\\s*\\}\\s*","\\}",x,perl=T) # remove spaces around brackets
  x<-gsub(";"," ",x) # convet colons to commas
  x<-gsub("^\\{","",x)  # remove first bracket
  x<-gsub("([A-Z]{2}),([0-9]{5})","\\1-\\2",x)  # convert comma seperating zip.state to hyphen

  x<-strsplit(x,"\\},\\{")  # split text blob on },{ to create list of PSCs
  y<-as.data.frame(matrix(unlist(lapply(x, strsplit,",")),ncol=5,byrow=T))  # split again on commas to get matrix of atributes by PSC
  }
  y[,-5]  # remove link attribute
}
