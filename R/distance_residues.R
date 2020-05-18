#' Distance Between Residues
#'
#' Uses functions from the Bio3d package to calculate distance of the calphas from two given residues, across all of the frames in a .pdb object.
#' @param some_pdb The pdb to be analysed.
#' @param res1 The first residue.
#' @param res2 The second residue.
#' @keywords pdb, bio3d, FRET, distance
#' @export
#' @examples
#'
#' distance_residues(some_pdb, 96, 397)


distance_residues <- function(some_pdb, res1, res2){

  #creating dataframe to write to
  results_frame = data.frame(
    frame = 0,
    distance = 0)

  #getting how many frames in pdb

  no_frames = dim(some_pdb$xyz)[1]

  print(paste("There are", no_frames, "frames in this file. Distances between Residue", res1, "and", res2, "calculated."))

  #going through each frame, getting distance between
  #the specified residue calphas

  for (i in 1:no_frames){

    results_frame[i,] <- c(no_frames-i, as.numeric(return_xyz(some_pdb, res1, i),
                                                   return_xyz(some_pdb, res2, i)))
  }

  return(results_frame)

}
