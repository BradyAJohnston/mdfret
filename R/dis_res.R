#' Distance Between Residues Across Frames
#'
#' Uses functions from the Bio3d package to calculate distance of the calphas from two given residues, across all of the frames in a given .pdb object.
#' Returns a dataframe with corresponding frames and distances.
#' @param pdb The pdb to be analysed.
#' @param r1 The first residue.
#' @param r2 The second residue.
#' @param string Selection string passed to atom.select(string = string)
#' @param ncore Conducts calculations in parallel if package parallel is installed.
#' @keywords pdb, bio3d, distance
#' @export
#' @examples
#'
#' dis_Res(some_pdb, 91, 371)


dis_res <- function(frames,
                    res1,
                    res2,
                    string = "calpha",
                    ncore = 6) {
  out_df <- data.frame(
    frame = 0,
    distance = dist.xyz(
    a = frames$xyz[, atom.select(frames, resno = res1, string = "calpha")$xyz],
    b = frames$xyz[, atom.select(frames, resno = res2, string = "calpha")$xyz],
    all.pairs = F,
    ncore = ncore
  )
  )
  out_df$frame <- 1:nrow(out_df)
  out_df
}

