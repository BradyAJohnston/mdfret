% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apo_pdb.R
\docType{bio3d}
\name{apo_pdb}
\alias{apo_pdb}
\title{Bio3D pdb file for apo structure.}
\format{
A bio3d-pdb class object.
\describe{
 \item(xyz){xyz Coordinates for the apo structure.}
}
}
\usage{
data(apo_pdb)
}
\description{
Bio3D pdb file for apo structure.
}
\examples{
data(grav)
times <- attr(grav, "time")
phe <- grav$pheno
\donttest{iplotCurves(phe, times)}
}
\references{
Brady Johnston, unpublished work (as of Aug 2020)
}
\keyword{apo,}
\keyword{bio3d,}
\keyword{datasets,}
\keyword{pdb}
