% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/net.R
\name{net_is_directed}
\alias{net_is_directed}
\alias{net_is_directed.igraph}
\alias{net_is_directed.network}
\title{Is a network directed?}
\usage{
net_is_directed(.net)

\method{net_is_directed}{igraph}(.net)

\method{net_is_directed}{network}(.net)
}
\arguments{
\item{.net}{network of class \code{igraph} or \code{network}.}
}
\value{
\code{logical} scalar
}
\description{
Is a network directed?
}
\examples{
net_is_directed(.net = florence_business_ig)

florence_business_nw \%>\% 
  net_is_directed()

}
\author{
Brendan Knapp \email{brendan.knapp@nps.edu}
}
