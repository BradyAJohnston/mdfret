% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/html_highlight.R
\name{html_highlight}
\alias{html_highlight}
\title{Highlight HTML}
\usage{
html_highlight(t1, text, t3, colour = "#FF4500")
}
\arguments{
\item{t1}{Text that will precede coloured text.}

\item{text}{Text that will be highlighted with colour.}

\item{t3}{Text that will follow coloured text.}

\item{colour}{Colour of the highlighting. Hex code required i.e. #FF4500}
}
\description{
Returns text with colour and bold html formatting.
}
\details{
Returns text that is surrounded with the <strong> and <span style='colour:'#colour'> that will colour the text to emphasise it. Requires special characters like dashes "-" to be be double-escaped "\\-" to be parsed correctly.
}
\examples{

html_highlight("Code\\\\-looking text that ", "will contain red.", "")

}
\keyword{highlight,}
\keyword{html,}
\keyword{monospace}
