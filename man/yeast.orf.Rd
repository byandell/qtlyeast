\name{yeast.orf}
\alias{yeast.orf}
\alias{yeast.annot}
\alias{highlod.orf}
\alias{highlodmax.orf}
\docType{data}
\title{
Cross object with edited yeast data from Brem and Kruglyak
}
\description{
The Brem and Kruglyak (2005) Science yeast data organized into an R/qtl
cross object.
}
\usage{
data(yeast.orf)
data(yeast.annot)
data(highlod.orf)
data(highlodmax.orf)
}
\details{This is a cross object (see \code{\link[qtl]{read.cross}})
  containing Brem and Kruglyak (2001) yeast data with 112 individuals,
  2956 markers, and 5740 phenotypes. Data were cleaned and updated by
  Jun Zhu and others at Sage Bionetworks before being organized by Elias
  Chaibub Neto and Brian Yandell into this package.
}
\references{
Brem and Kruglyak (2001) Science
}
\seealso{\code{\link{cand.reg}}, \code{\link[qtlhot]{highlod}}}
\examples{
data(yeast.orf)
summary(yeast.orf)
\dontrun{
yeast.orf <- calc.genoprob(yeast.orf, step = 2)
scan.orf <- scanone(yeast.orf, pheno.col = seq(nphe(yeast.orf)), method = "hk")
save(scan.orf, file = "scan.orf.RData", compress = TRUE)
highlod.orf <- highlod(scan.orf, pheno.col = seq(nphe(yeast.orf)),
  lod.thr = 3.47, drop.lod = 1.5, extend = TRUE, restrict.lod = FALSE)
highlodmax.orf <- pull.highlods(scan.orf, pheno.col = seq(nphe(yeast.orf)),
  lod = 3.47, drop.lod = 1.5, extend = TRUE, restrict.lod = TRUE)
}
data(highlod.orf)
highlod.orf[1:5,]
}
\keyword{datasets}
