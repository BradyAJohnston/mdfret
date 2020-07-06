#' Calculate FRET
#'
#' Uses the FRET equation with a given R0 to return expected FRET values for a particular distance column.
#' @param df The df containing a distance column.
#' @param R0 The R0 value to be used in the FRET calculation.
#' @keywords pdb, bio3d, FRET
#' @export
#' @examples
#' df1 <- data.frame(
#'   something = c(1,2,3,4),
#'   distance = rnorm(4, 4, 0.2)
#'   )
#'
#' fretcalc(df1, 52)



fretcalc <- function(df, R0){

  df$FRET <- 1 / (1 + (df$distance / R0)^6)

  return(df)
}
