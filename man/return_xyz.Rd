\name{return_xyz}
\alias{return_xyz}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
return_xyz(some_pdb, some_residue, some_frame)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{some_pdb}{
%%     ~~Describe \code{some_pdb} here~~
}
  \item{some_residue}{
%%     ~~Describe \code{some_residue} here~~
}
  \item{some_frame}{
%%     ~~Describe \code{some_frame} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (some_pdb, some_residue, some_frame) 
{
    selec.xyz <- atom.select.pdb(some_pdb, string = "calpha", 
        resno = some_residue)$xyz
    some_pdb$xyz[some_frame, selec.xyz]
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
