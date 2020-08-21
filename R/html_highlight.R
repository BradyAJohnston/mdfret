#' Highlight HTML
#'
#' Returns text with colour and bold html formatting.
#'
#' Returns text that is surrounded with the <strong> and <span style='colour:'#colour'> that will colour the text to emphasise it. Requires special characters like dashes "-" to be be double-escaped "\\-" to be parsed correctly.
#' @param t1 Text that will precede coloured text.
#' @param text Text that will be highlighted with colour.
#' @param t3 Text that will follow coloured text.
#' @param colour Colour of the highlighting. Hex code required i.e. #FF4500
#' @keywords highlight, html, monospace
#' @export
#' @examples
#'
#' html_highlight("Code\\-looking text that ", "will contain red.", "")
#'

html_highlight <- function(t1, text, t3, colour="#FF4500"){
  paste(t1, "<strong><span style='color:#", colour, "'>", text, "</span></strong>", t3, sep = "")
}
