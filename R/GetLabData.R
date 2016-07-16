#' Get LabCorp lab location data
#'
#' Executes the search query, retrieves the raw html, and extracts the location data into a dataframe.
#' @param url seach url created by the \code{\link{makeurl}} function
#' @return dataframe
#' @export
GetLabData<- function(url){
  x<- gethtml(url)
  y<- cleanhtml(x)
  formatdata(y)
}
