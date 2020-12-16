#' Get Slices
#'
#' Returns a matrix of logicals, for use in filtering in the get_frames function.
#' @param frames Vector of the frames to be extracted.
#' @param divider Integer for the size of the the slices, in number of frames. Default to 10000.
#'
#' @keywords pdb, bio3d, filter
#' @export
#' @examples
#' Internal use for the get_frames function.


get_slices = function(frames, divider = 10000){

  # find which slice the frame exists on
  slices = frames %/% divider + 1

  # create matrix for results
  results_matrix = matrix(ncol = length(frames), nrow = max(unique(slices)+1))

  #create the filters for each frame
  # for subsequent analysis
  for(i in 1:max(slices)){
    filt_list = slices == i
    results_matrix[i,] = filt_list
  }

  # return the final list
  # return(list_of_fils)
  return(results_matrix)
}
