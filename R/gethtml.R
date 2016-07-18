#' Get raw html
#'
#' Retrieves the raw html response after passing the query string to the server
#'
#'@param myURL url string created by \code{\link{makeurl}} function
#'@return character string
#'@importFrom dplyr "%>%"
#'@importFrom xml2 "read_html"
#'
gethtml<- function(myURL){
  xml2::read_html(myURL) %>%
    rvest::html_nodes("script") %>%
    .[[29]] %>%
    rvest::html_text()
}
