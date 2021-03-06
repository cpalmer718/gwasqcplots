% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remap.p.values.R
\name{remap.p.values}
\alias{remap.p.values}
\title{Convert raw p-values to plottable values with optionally
correction.}
\usage{
remap.p.values(input.p, gc.correct)
}
\arguments{
\item{input.p}{numeric vector of input p-values}

\item{gc.correct}{logical; whether to apply GC correction}
}
\value{
numeric vector of p-values, optionally GC corrected,
with -log10 transform applied
}
\description{
Take a vector of p-values from an input file.
Apply GC correction if requested, handling small
p-values as needed. Return -log10 of either corrected
or uncorrected values for plotting in QQ or Manhattan plots.
}
\details{
GC (genomic control) correction is an old ad hoc method
of adjusting inflation in the test statistic distribution
of a GWAS. The method converts the p-values to corresponding
1-df Chi^2 test statistics, and then adjusts them all by
a normalization factor (median(observed) /
median(uniform random p-values)).

Note that a GC inflation factor less than 1, indicating
test statistic \emph{deflation}, is very possible for various,
usually bad, reasons, and conventionally such a correction
factor is unconditionally set to 1, to avoid artificially
inflating a distribution.

A number of assumptions underpin the sane usage of GC
correction. Note most importantly that:
\itemize{
\item inflation does not necessarily mean stratification,
nor does it necessarily mean polygenicity
\item deflation often means convergence problems with model
\item LD pruning should be applied before inflation factor
calculation; this is a candidate for future features
\item it can be difficult to visually evaluate the inflation
factor's suitability in a distribution due to how heavily
the median is weighted by the bulk of the distribution
\item inflation factor calculation assumes genome-wide variants
are present, among other things. do not apply GC correction
when only a partial set of variants is available
}
}
