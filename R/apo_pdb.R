#' Bio3D pdb file for apo structure.
#'
#'
#' @docType bio3d
#'
#' @usage data(apo_pdb)
#'
#' @format A bio3d-pdb class object.
#' \describe{
#'  \item(xyz){xyz Coordinates for the apo structure.}
#'}
#' @keywords datasets, bio3d, apo, pdb
#'
#' @references Brady Johnston, unpublished work (as of Aug 2020)
#'
#' @examples
#' data(grav)
#' times <- attr(grav, "time")
#' phe <- grav$pheno
#' \donttest{iplotCurves(phe, times)}
"apo_pdb"
