% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetLabData.R
\name{GetLabData}
\alias{GetLabData}
\title{Get LabCorp lab location data}
\usage{
GetLabData(url)
}
\arguments{
\item{url}{seach url created by the \code{\link{makeurl}} function}
}
\value{
dataframe
}
\description{
Executes the search query, retrieves the raw html, and extracts the location data into a dataframe.
}
