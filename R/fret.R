#' FRET Calculation
#'
#' Calculates FRET efficiency from input atomic distance and R0 radius.
#'
#' Using the FRET equaiton, calculates the estimated FRET efficiency from a given distance of two flouorophores. Default R0 value is 54.
#'
#' @param distance Distance of the two fluorophores, in angstroms.
#' @param R0 R0 radius for the two flouorophores, determins the falloff of the energy transfer.
#' @keywords fret
#' @export
#' @examples
#'
#' fret(distance = 70)
#'

fret <- function(distance, R0 = 54) {
  1 / (1 + (distance / R0)^6)
}


