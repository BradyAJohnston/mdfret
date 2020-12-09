#' Compare Frames
#'
#' For comparison within bio3d frame objects. Comparing particular regions
#' within a structure across a set of frames. Compares to an apo and bound
#' structures that produces a dataframe with calculated rmsd values.
#'
#' Returns a dataframe with corresponding frames and rmsds.
#' @param bound_pdb The bound_pdb reference structure.
#' @param apo_pdb The apo_pdb reference structure.
#' @param frames_model The bio3d model that contains the frames to be analysed.
#' @param selection Numeric AA selection of the model
#' @param string Selection string for atom.select.pdb (default is "calpha")
#' @param ncore Number of cores to parallelise the workload (defaults to 6). Requires package parallel.
#' @param fit Whether or not to fit the structures prior to calculating the RMSD values.
#' @keywords pdb, bio3d, FRET, distance
#' @export
#' @examples
#'
#' dis_Res(some_pdb, 91, 371)


compare_frames <-
  function(bound_pdb,
           apo_pdb,
           frames_model,
           selection,
           string = "calpha",
           ncore = 6,
           fit = T) {

    if (fit != T) {
      if (fit != F) {
        print("Fit must LOGICAL either TRUE or FALSE")
        break
      }
    }

    bound_reference = atom.select.pdb(pdb = bound_pdb,
                                      resno = selection,
                                      string = string)

    apo_reference = atom.select.pdb(pdb = apo_pdb,
                                    resno = selection,
                                    string = string)

    frames_reference = atom.select.pdb(pdb = frames_model,
                                       resno = selection,
                                       string = string)

    bound_fits = rmsd(
      a = bound_pdb,
      b = frames_model,
      a.inds = bound_reference$xyz,
      b.inds = frames_reference$xyz,
      fit = fit,
      ncore = ncore
    )

    apo_fits = rmsd(
      a = apo_pdb,
      b = frames_model,
      a.inds = apo_reference$xyz,
      b.inds = frames_reference$xyz,
      fit = fit,
      ncore = ncore
    )

    if (is.null(frames_model$framenos)) {
      results_df =
        data.frame(
          modelno = 1:dim(frames_model$xyz)[1],
          apo.rmsd = apo_fits,
          bound.rmsd = bound_fits
        )

    }else {
      results_df =
        data.frame(
          frame = frames_model$framenos,
          modelno = 1:dim(frames_model$xyz)[1],
          apo.rmsd = apo_fits,
          bound.rmsd = bound_fits
        )

    }

    return(results_df)

  }
