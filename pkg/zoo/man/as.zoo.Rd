\name{as.zoo}
\alias{as.zoo}
\alias{as.zoo.default}
\alias{as.zoo.data.frame}
\alias{as.zoo.fts}
\alias{as.zoo.its}
\alias{as.zoo.irts}
\alias{as.zoo.matrix}
\alias{as.zoo.mcmc}
\alias{as.zoo.tis}
\alias{as.zoo.xts}
\alias{as.zoo.zoo}
\alias{as.matrix.zoo}
\alias{as.vector.zoo}
\alias{as.data.frame.zoo}
\alias{as.list.zoo}
\alias{as.list.ts}
\alias{as.zoo.ts}
\alias{as.ts.zoo}

\title{Coercion from and to zoo}
\description{
Methods for coercing \code{"zoo"} objects to other classes and
a generic function \code{as.zoo} for coercing objects to class \code{"zoo"}.
}
\usage{
as.zoo(x, \dots)
}
\arguments{
  \item{x}{an object,}
  \item{\dots}{further arguments passed to \code{\link{zoo}} when the return
    object is created.}
}

\details{
\code{as.zoo} currently has a default method and methods for \code{\link{ts}},
\code{fts} (currently archived on CRAN), \code{\link[tseries]{irts}},
\code{\link[coda]{mcmc}}, \code{\link[tis]{tis}}, \code{\link[xts]{xts}} 
objects (and \code{\link{zoo}} objects themselves).

Methods for coercing objects of class \code{"zoo"} to other classes
currently include: \code{\link{as.ts}}, \code{\link{as.matrix}}, \code{\link{as.vector}},
\code{\link{as.data.frame}}, \code{\link{as.list}} (the latter also being available
for \code{"ts"} objects). Furthermore, \code{\link{fortify.zoo}} can transform \code{"zoo"}
series to \code{"data.frame"} including the time index and optionally melting a wide series
into a long data frame.

In the conversion between \code{zoo} and \code{ts}, the \code{\link{zooreg}} class is
always used.
}

\value{
\code{as.zoo} returns a \code{\link{zoo}} object.
}

\seealso{\code{\link{zoo}}, \code{\link{fortify.zoo}},
  \code{\link{zooreg}}, \code{\link{ts}}, \code{\link[tseries]{irts}}, 
  \code{\link[tis]{tis}}, \code{\link[coda]{mcmc}},
  \code{\link[xts]{xts}}.
}  

\examples{
suppressWarnings(RNGversion("3.5.0"))
set.seed(1)

## coercion to zoo:
## default method
as.zoo(rnorm(5))
## method for "ts" objects
as.zoo(ts(rnorm(5), start = 1981, freq = 12))

## coercion from zoo:
x.date <- as.POSIXct(paste("2003-", rep(1:4, 4:1), "-", sample(1:28, 10, replace = TRUE), sep = ""))
x <- zoo(matrix(rnorm(24), ncol = 2), x.date)
as.matrix(x)
as.vector(x)
as.data.frame(x)
as.list(x)
}
\keyword{ts}
