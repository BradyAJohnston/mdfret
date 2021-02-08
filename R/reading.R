#' Read and Name COLVAR File
#'  @export
readcolvar <- function(file) {
  df <- read.table(file)
  colnames(df) <- c("time", "path.sss", "path.zzz", "metad.rbias", "walls.bias", "rmsd0", "rmsd1")
}

#' Read and Name HILLS File
#'  @export
readhills <- function(file) {
  df <- read.table(file)
  colnames(df) <- c("time", "path.sss", "path.zzz", "sigma_path.sss", "sigma_path.zzz", "height", "biasf")
}

#' Read and Name FES File
#'  @export
readfes <- function(file) {
  df <- read.table(file)
  colanmes(df) <- c("sss.sss", "zzz.zzz", "ff1", "dff1_sss.sss", "dff1_zzz.zzz")
}
