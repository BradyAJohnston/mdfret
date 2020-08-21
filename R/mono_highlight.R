#' Mono Highlight HTML
#'
#'Returns text with monospaced and colour html formatting.
#'
#' Returns text that is surrounded with the <tt> html flag for monospaced font, but also additional <strong> and <span style='colour:'#colour'> that will colour the text to emphasise it. Requires special characters like dashes "-" to be be double-escaped "\\-" to be parsed correctly.
#' @param t1 Text that will precede coloured text. Still monospaced.
#' @param text Text that will be highlighted with colour, and monospaced.
#' @param t3 Text that will follow coloured text. Still monospaced.
#' @param colour Colour of the highlighting. Hex code required i.e. #FF4500
#' @keywords highlight, html, monospace
#' @export
#' @examples
#'
#' mono_highlight("Code\\-looking text that ", "will contain red.", "")
#'

mono_highlight <- function(t1, text, t3, colour="#FF4500"){
paste('<tt>', t1, "<strong><span style='color:", colour, "'>", text, "</span></strong>", t3, '</tt>', sep = "")
}
