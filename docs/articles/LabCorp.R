## ---- echo=F-------------------------------------------------------------
knitr::opts_chunk$set(eval=F)


## ------------------------------------------------------------------------
#  library(LabCorp)

## ---- tidy=F-------------------------------------------------------------
#  referer<-paste0("/wps/portal/!ut/p/c1/04_SB8K8xLLM9MSSzPy8xBz9CP0os",
#                  "_hACzO_QCM_IwMLo1ALAyNj1yBnQxNfAwN_U6B8JG55AyMCuv0",
#                  "88nNT9SP1o8zjQ11Ngg09LY0N_M3DjA08DcPcfFwcjQwNgk30Q",
#                  "_QjnYGKIvEqKsiNKDfUDVQEAO_Izxc!/dl2/d1/L0lJWm1abVp",
#                  "tS0NsRS9vQXdRQUVFVUFBQ0FDeFFBQUlCQWxBQUFnREtVQUFDQ",
#                  "VlaUUFBSUFqbEFBQWdDQlVBQUNBQWxRQUFJQUJWQUFBZ0FORzB",
#                  "heEFBQWdHZ0EhIS9ZSTUwc3V5bHdBISEvN19VRTRTMUk5MzBPN",
#                  "1YzMEkxVkZMREEyMTBTNC9zZWFyY2g!/")
#  
#  library(zipcode)
#  data(zipcode)
#  zips<-as.list(zipcode$zip)
#  names(zips)[1:length(zips)]<- "zipCode"
#  URLs<- sapply(1:9, function(x) makeurl(params=zips[x], referer=referer))

## ---- eval=F-------------------------------------------------------------
#  head <- "lat,long,street,city,state,zip"
#  filename <- "LabCorp_PSC_Listing.csv"
#  writeLines(head,filename)

## ---- eval=FALSE---------------------------------------------------------
#  len<- length(URLs)
#  for (url in URLs){
#    a<- GetLabData(url)
#    if(!is.null(a)){
#    suppressWarnings(
#      write.table(a,
#                filename,
#                row.names = F,
#                append=T,
#                sep=",",
#                col.names = F))
#      }
#    cat(paste0("Complete iteration: ",which(URLs==url)), " of ",len,"\n")
#    }

## ---- eval=FALSE---------------------------------------------------------
#  dat<- read.csv(filename)
#  LabLocations<- unique(dat)

