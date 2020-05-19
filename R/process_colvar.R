#' Open and Read ABMD_COLVAR
#'
#' This function speeds up the openign and processing of the ABMD_COLVAR output file from ABMD inside GROMACS.
#' @param file The COLVAR_ABMD file to be opened.
#' @param some_colnames Specify other colnames for the read in table other than the default.
#' @param AAnum Specify differnt number of amino acid residues for normalising the alpha value, defaulting to 610.
#' @keywords COLVAR, ABMD, GROMACS
#' @export
#' @examples
#' prcoess_colvar(file = "1/COLVAR_ABMD")

process_colvar <- function(file, some_colnames = NULL, AAnum = 610){
  rdf <- read.table(file)
  if(is.null(some_colnames) != 1){
    colnames(rdf) <- some_colnames
  }else{
  if(length(rdf[1,]) == 6){

  colnames(rdf) <- c("time", "RMSD0", "RMSD1", "alpha", "total.bias", "RMSD0_min")
  rdf$alpha <- rdf$alpha / (AAnum-6)

  }else{
    if(length(rdf[1,] == 5)){
      colnames(rdf) <- c("time", "RMSD0", "RMSD1", "total.bias", "RMSD0_min")
    }else{
      print("Please provide valid colnames that match those being read.")
    }

    }
  }
  m.rdf <- melt(rdf, id.vars = c("time"))
  return(m.rdf)
  }
