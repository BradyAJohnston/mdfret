#' Distance Between Residues
#'
#' Uses functions from the Bio3d package to calculate distance of the calphas from two given residues, across all of the frames in a .pdb object.
#' Returns a dataframe with corresponding frames and distances.
#' @param pdb The pdb to be analysed.
#' @param r1 The first residue.
#' @param r2 The second residue.
#' @keywords pdb, bio3d, FRET, distance
#' @export
#' @examples
#'
#' dis_Res(some_pdb, 91, 371)


dis_res <- function(pdb, r1, r2){

  frames = dim(pdb$xyz)[1]

  output_df = data.frame(
    frame = 0,
    distance = 0
  )

  for(i in 1:frames){
    #get xyz coordinates for the two residues at particular frames.
    res1 = res_xyz(pdb, res = r1)[i,]
    res2 = res_xyz(pdb, res = r2)[i,]
    #computes distance between the two xyz coordinates
    some_result <- dist.xyz(res1,res2)[1]
    #inputs the results into the output dataframe.
    output_df[i,] <- c(i, some_result)
    # print(a_data_frame[i,])
  }
  return(output_df)
}

