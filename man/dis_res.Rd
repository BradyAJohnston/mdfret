% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dis_res.R
\name{dis_res}
\alias{dis_res}
\title{Distance Between Residues Across Frames}
\usage{
dis_res(frames, res1, res2, string = "calpha", ncore = 6)
}
\arguments{
\item{string}{Selection string passed to atom.select(string = string)}

\item{ncore}{Conducts calculations in parallel if package parallel is installed.}

\item{pdb}{The pdb to be analysed.}

\item{r1}{The first residue.}

\item{r2}{The second residue.}
}
\description{
Uses functions from the Bio3d package to calculate distance of the calphas from two given residues, across all of the frames in a given .pdb object.
Returns a dataframe with corresponding frames and distances.
}
\examples{

dis_Res(some_pdb, 91, 371)
}
\keyword{bio3d,}
\keyword{distance}
\keyword{pdb,}
