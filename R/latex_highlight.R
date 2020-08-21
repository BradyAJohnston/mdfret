#' Highlight LaTeX
#'
#' Returns text with colour and monospaced LaTeX formatting..
#'
#' Returns text that is surrounded with the \ textcolor and \ texttt wrappers for LaTeX formatting.
#' @param t1 Text that will precede coloured text. Still monospaced.
#' @param text Text that will be highlighted with colour. Still monospaced.
#' @param t3 Text that will follow coloured text. Still monospaced.
#' @param colour Colour of the highlighting. Default "red".
#' @keywords highlight, html, monospace
#' @export
#' @examples
#'
#' html_highlight("Code\\-looking text that ", "will contain red.", "")
#'

latex_highlight <- function(t1, text, t3, colour="red"){
  paste("\\texttt{", t1, "\\textcolor{", colour, "}{", text, "}", t3, "}", sep = "")
}
