#' Create a query string
#'
#' This query string will become part of the search URL passed to the LabCorp servers.
#'
#'@param x List with search parameters.
#'\itemize{
#' \item streetAddress
#' \item city
#' \item state - 2 character abbreviation
#' \item zipCode - string of 5 numeric characters
#' \item radius
#' \item testType
#' }
#' @return string
querystring<- function(x){
  if(is.null(x$streetAddress) & is.null(x$city) & is.null(x$state) & is.null(x$zipCode)){
    stop("You must supply at lease one seach criteria")
  }

  if(is.null(x$radius)){
    x$radius<-10
  }

  if(is.null(x$testType)){
    x$testType<-"ROUTINE_PHLEBOTOMY"
  }

  # Error check state abbreviation if not null
  if(!is.null(x$state)){
      if(!toupper(x$state) %in% state.abb){
        stop("state is not a valid state abbreviation")
      }
  }

  mileage<- c(1,5,10,25,35,50,75)
  if(!x$radius %in% mileage){
    x$otherRadius<- x$radius
    x$radius<- "Other"
  } else{
    x$otherRadius<-"Enter+miles"
  }

  paste0("?streetAddress=", x$streetAddress,
         "&city=", x$city,
         "&state=", x$state,
         "&zipCode=", x$zipCode,
         "&radius=",x$radius,
         "&otherRadius=", x$otherRadius,
         "&testType=",x$testType,
         "&x=37&y=13")
  }
