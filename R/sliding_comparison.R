#' Sliding Comparison
#'
#' Takes an AA region of size segment_size, and compares between structures
#' entirety of AA sequence. Moves segment by segment_slide each time.
#'
#' Returns a dataframe with corresponding frames, rmsds and regions.
#' @param segment_size Size of AA sequence in the comparison segment.
#' @param segment_slide Change in segment comparison, per comparison.
#' @param bound_pdb The bound_pdb reference structure.
#' @param apo_pdb The apo_pdb reference structure.
#' @param frames_model The bio3d model that contains the frames to be analysed.
#' @param ncore Number of cores to parallelise the workload (defaults to 6). Requires package parallel.
#' @param fit Whether or not to fit the structures prior to calculating the RMSD values.
#' @keywords pdb, bio3d, FRET, distance
#' @export
#' @examples
#'


sliding_comparison <- function(
  segment_size,
  segment_slide,
  bound_pdb,
  apo_pdb,
  frames_model,
  ncore = 6,
  fit = T
){
  output_list = list()

  number_of_slides = max(bound_pdb$atom$resno) / segment_slide - 1

  pb <- progress::progress_bar$new(total = round(number_of_slides))

  for(i in 1:number_of_slides){
    pb$tick()

    beginning = (i-1)*segment_slide + 1
    ending = (i-1)*segment_slide + segment_size

    results_data <-  compare_frames(
      bound_pdb = bound_pdb,
      apo_pdb = apo_pdb,
      frames_model = frames_model,
      selection = beginning:ending,
      ncore = ncore,
      fit = fit
    )
    results_data$region = i
    output_list[[i]] <- results_data
  }

  cdf <- do.call(rbind, output_list)
  return(cdf)
}
