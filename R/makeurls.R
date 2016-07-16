#' Make URL string
#'
#' Creates a URL strings which can be used to scrape LabCorp's website for location data based on a search query. This function only forms the URL string which must be passed to another funtion to retrieve the data.
#'
#' @param referer Character string. See the vignette for details.
#' @param params List of query parameters passed on to \code{\link{querystring}} where they are parsed into key value pairs and then formated for the URL string.
#' @return character string
#' @export
#'
#' @section Referer:
#' The referer is built into the url string as a way to identify where the request was initiated from.  The referer also allows the server to validate a request was properly initiated. Without a valid referer value, the server may not return any results from the query. In the case of webscraping, this acts as a barrier to programattically extracting the location data from the website.  The referer value changes with each session so a current value should be supplied each time a URL string is built.  This is not to say a new referer needs to be provided for each URL string.  Multiple queries can be run in each session.


makeurl<- function(params=list(), referer){
  handle<-"https://www.labcorp.com"

  paste0(handle,
         referer,
         querystring(params))
}
