#' Bio3D pdb file for bound structure.
#'
#'
#' @docType bio3d
#'
#' @usage data(bound_pdb)
#'
#' @format A bio3d-pdb class object.
#' \describe{
#'  \item(xyz){xyz Coordinates of the bound structure for dPPR10-C2 for molecular dynamics.}
#'}
#' @keywords datasets, bio3d, bound, pdb
#'
#' @references Brady Johnston, unpublished work (as of Aug 2020)
#'
#' @examples
#' data(grav)
#' times <- attr(grav, "time")
#' phe <- grav$pheno
#' \donttest{iplotCurves(phe, times)}
"bound_pdb"
