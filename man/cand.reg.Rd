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
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
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
\dontrun{
data(yeast.orf)
yeast.orf <- calc.genoprob(yeast.orf, step = 2)
data(highlod.orf)
data(yeast.annot)
data(ko.list)
cand.reg <- GetCandReg(yeast.orf, highlod.orf, yeast.annot, names(ko.list))
cis.cand.reg <- GetCisCandReg(yeast.orf, highlod.orf, cand.reg)
}
data(cand.reg)
cand.reg[1:10,]
data(cis.cand.reg)
dim(cis.cand.reg[[1]])
cis.cand.reg[[1]][1:10,]
comap.targets <- GetCoMappingTraits(yeast.orf, highlod.orf, cand.reg)
}
\keyword{datasets}
