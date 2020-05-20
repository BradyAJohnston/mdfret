#' Residue XYZ
#'
#' Returns the XYZ coordinate of the specified atom from the selected residue, across all frames of a pdb object.
#' @param pdb The pdb to be processed.
#' @param res The dbl index of the selected residue.
#' @param atomtype Selection of atom to be return, defaults to calpha.
#' @keywords pdb, bio3d, calpha
#' @export
#' @examples
#' res_xyz(some_pdb, 6)


res_xyz <- function(pdb, res, atomtype = "calpha"){

  xyz_index <- atom.select(inpdb, string = atomtype, resno = res)$xyz
  return(inpdb$xyz[,xyz_index])
}
