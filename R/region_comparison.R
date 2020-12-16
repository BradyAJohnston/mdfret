#' Region Comparison
#'
#' Compares a specfic section of a structure (region) along the entirety of the
#' structure across multiple frames in a bio3d object.
#'
#' Returns a dataframe with corresponding frames, rmsds and regions.
#' @param bound_pdb The bound_pdb reference structure.
#' @param apo_pdb The apo_pdb reference structure.
#' @param frames_model The bio3d model that contains the frames to be analysed.
#' @param num_segments Number of segments to split the AA chain into.
#' @param ncore Number of cores to parallelise the workload (defaults to 6). Requires package parallel.
#' @param fit Whether or not to fit the structures prior to calculating the RMSD values.
#' @keywords pdb, bio3d, FRET, distance
#' @export
#' @examples
#'


region_comparison <-
  function(
    bound_pdb,
    apo_pdb,
    frames_model,
    num_segments,
    ncore = 6,
    fit = T) {

  output_list = list()

  splitter = max(bound_pdb$atom$resno) / num_segments

  for(i in 1:num_segments){

    beginning = (i * splitter - splitter + 1 ) %/% 1
    ending = (i * splitter) %/% 1

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
