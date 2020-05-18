#' Rturn XYZ
#'
#' Returns the XYZ coordinate of the calpha atom from a particular residue, on a particlar frame from a .pdb object read in via the bio3d pacakge.
#' @param some_pdb The pdb to be analysed.
#' @param some_residue The particular residue to be selected.
#' @param some_frame The particular frame to select XYZ from (for multi-frame pdb files).
#' @keywords pdb, bio3d
#' @export
#' @examples
#' return_xyz(a_pdb, 6, 6)


return_xyz <- function(some_pdb, some_residue, some_frame){
  selec.xyz <- atom.select.pdb(some_pdb, string="calpha", resno = some_residue)$xyz
  return(some_pdb$xyz[some_frame, selec.xyz])
}
