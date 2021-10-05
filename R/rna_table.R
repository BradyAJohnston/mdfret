#' Data Table of Experimental RNA
#'
#' Sequences of RNA for MD and FRET experiments. Raw sequences are available, as well as some
#' pre-formatted sequences for use in geom_richtext and kable for both html and LaTeX, that highlight
#' the mismatches between these and the target RNA sequence.
#'
#' @docType data
#'
#' @usage data(rna_table)
#'
#' @format A data frame with columns:
#' \describe{
#' \item(rna){Numeric value given to RNA, (0 being no RNA)}
#'  \item(name){Name given to the sequnce, BAJ_01-BAJ_13 and noRNA.}
#'  \item(latex_name){Name that has escaped underscores "\_" for LaTeX formatting.}
#'  \item(raw_seq){RNA sequence, 5ʹ to 3ʹ of each RNA.}
#'  \item(html_seq){Sequences with mismatch to BAJ_01 highilgihted in RED using html flags. Compatible with geom_richtext for labelling.}
#'  \item(mono_seq){Seqeunces with mismatches to BAJ_01 highlighed in RED and also a monospaced font, using html flags. Compatible with kable(html) for making tables.}
#'  \item(latex_seq){Sequences with misatch to BAJ_01 highlighed in RED with LaTeX formatting and also a monospaced font. Compatible with kable(latex) for makint tables.}
#'  }
#'
#' @keywords datasets, rna, sequnce
#'
#' @references Brady Johnston, unpublished work (as of Aug 2020)
#'
#' @examples
#' data(grav)
#' times <- attr(grav, "time")
#' phe <- grav$pheno
#' \donttest{iplotCurves(phe, times)}
"rna_table"

