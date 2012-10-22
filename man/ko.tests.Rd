\name{ko.tests}
\alias{ko.tests}
\alias{adj.ko.tests}
\alias{roc.aux}
\docType{data}
\title{
Knockout tests and summaries.
}
\description{
Knock out tests, with adjustment for Benjamini-Hockberg, and summary of
test runs on yeast data.
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
\seealso{\code{\link{yeast.orf}}, \code{\link[qtlhot]{FitAllTests}},
  \code{\link[qtlhot]{JoinTestOutputs}}, \code{\link[qtlhot]{PrecTpFpMatrix}}}
\references{
  Brem Kruglyak (2005) Science.
  
}
\examples{
library(qtlhot)
example(cand.reg)
\dontrun{
set.seed(123456789) # we fix a seed because cit uses bootstrap
for (k in 1 : 135) {
  cat("trait=", k, "\n")
  out <- FitAllTests(cross = yeast.orf,
                     pheno1 = cand.reg[k, 1],
                     pheno2 = comap.targets[[k]],
                     Q.chr = cand.reg[k, 4],
                     Q.pos = cand.reg[k, 5])
  save(out, file=paste("output_ko_validation", cand.reg[k, 1], "RData",
       sep = "."), compress = TRUE)
}
ko.tests <- JoinTestOutputs(comap.targets)
save(ko.tests, file = "ko.tests.RData", compress=TRUE)
}
adj.ko.tests <- p.adjust.np(ko.tests)
\dontrun{
roc.aux <- PrecTpFpMatrix(alpha = seq(0.01, 0.10, by = 0.01),
                          nms = cand.reg[, 1],
                          val.targets = ko.list,
                          all.orfs = highlod.orf$names,
                          tests = adj.ko.tests,
                          cis.index = cis.cand.reg[[2]])
}
## Plot setup.
plots <- function(roc.aux, elements) {
  par(mfrow = c(1,3))
  par(mar=c(5, 4.1, 4, 2) + 0.1)
  myplot(roc.aux[[elements[1]]], "Number of true positives", "(a)")
  myplot(roc.aux[[elements[2]]], "Number of false positives", "(b)")
  myplot(roc.aux[[elements[3]]], "Precision", "(c)")
}
myplot <- function(sum.type, sum.label, main = "") {
  ymax <- max(sum.type)
  my.pch <- c(1, 21, 24, 23, 25, 2, 5, 6, 8)
  xaxis <- seq(0.01, 0.10, by=0.01)
  yaxis <- seq(0, ymax,length.out = length(xaxis))
  plot(xaxis, yaxis, type = "n", ylab = sum.label, cex = 1.5,
       xlab = "target level", cex.axis = 1.5,
       cex.lab = 1.7, main = main, cex.main = 2)
  for (k in 1 : 9) {
    lines(xaxis, sum.type[k,], type="b", lwd=2, pch=my.pch[k], cex=1.5,
          col = "black", bg = "black")
  }
}

## Figure 5: all 135 ko-gene/putative target lists
plots(roc.aux, c("Tp1","Fp1","Prec1"))
## Figure 6: restricted to 27 cis ko-gene/putative target lists
plots(roc.aux, c("Tp2","Fp2","Prec2"))
}
\keyword{datasets}
