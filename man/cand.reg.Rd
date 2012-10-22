\name{cand.reg}
\alias{ko.list}
\alias{cand.reg}
\alias{cis.cand.reg}
\alias{comap.targets}
\docType{data}
\title{
Candidate regulators for yeast.
}
\description{
Find candidate regulators based on QTL mapping. Identify
cis-acting. Find co-mapping targets.
}
\usage{
data(ko.list)
data(cand.reg)
data(cis.cand.reg)
data(comap.targets)
}
\format{
  A data frame with 135 observations on the following 6 variables.
  \describe{
    \item{\code{gene}}{a character vector}
    \item{\code{phys.chr}}{a character vector}
    \item{\code{phys.pos}}{a numeric vector}
    \item{\code{peak.chr}}{a numeric vector}
    \item{\code{peak.pos}}{a numeric vector}
    \item{\code{peak.lod}}{a numeric vector}
  }
}
\details{
The \code{ko.list} comes from that TransFac yeast database (when? version?).
}
\seealso{\code{\link{yeast.orf}}}
\references{
Brem Kruglyak (2005) Science
}
\examples{
library(qtlhot)
data(highlod.orf)
data(yeast.annot)
data(ko.list)
cand.reg <- GetCandReg(highlod.orf, yeast.annot, names(ko.list))
dim(cand.reg)
head(cand.reg)
##
cis.cand.reg <- GetCisCandReg(highlod.orf, cand.reg)
dim(cis.cand.reg)
head(cis.cand.reg)
##
comap.targets <- GetCoMappingTraits(highlod.orf, cand.reg)
summary(sapply(comap.targets, length))
comap.targets[[7]]
length(unlist(comap.targets))
}
\keyword{datasets}
