#' Get Frames From Slices
#'
#' Returns a pdb object (bio3d) with models from all of the selected frames.
#' @param framenos Vector of freames to be selected from the revant slices saved on the HDD.
#' @param model Relevant simulaiton to extract frames from.
#' @param dir Directory where the relevant frames are saved.
#' @keywords pdb, bio3d, frames, extract
#' @export
#' @examples
#' get_frames(c(123, 45678, 37123), model = "norna")


get_frames <- function(framenos, model, dir=getwd()){

  # determine the slices to be read and processed
  slices = framenos %/% 10000 + 1

  # determine the frames inside those slices to be read
  relative_framenos = framenos %% 10000

  # returns a matrix of logicals for filtering the frame numbers
  # so that only those relevant to the slice currently being read in
  # is actually processed ignoring the other frames until their relevant
  # slice is read.

  fils = get_slices(framenos)

  ## Setting up dictionaries for choosing the frames file
  start_models <- list(
    "norna" <- "~/mdruns/protein/protein_metad/box.pdb",
    "BAJ01" <- "~/mdruns/BAJ_01/box.pdb",
    "BAJ02" <- "~/mdruns/BAJ_02/box.pdb",
    "BAJ02ext" <- "~/mdruns/BAJ_02_ext/box.pdb",
    "BAJ03" <- "~/mdruns/BAJ_03/box.pdb",
    "BAJ04" <- "~/mdruns/BAJ_04/box.pdb",
    "BAJ05" <- "~/mdruns/BAJ_05/box.pdb",
    "repeatBAJ05" <- "~/mdruns/repeat_BAJ_05/box.pdb",
    "BAJ06" <- "~/mdruns/BAJ_06/box.pdb",
    "BAJ07" <- "~/mdruns/BAJ_07/box.pdb",
    "BAJ08" <- "~/mdruns/BAJ_08/box.pdb",
    "BAJ12" <- "~/mdruns/BAJ_12/box.pdb",
    "BAJ13" <- "~/mdruns/BAJ_13/box.pdb"
  )

  # read in a base pdb file that trajectories will be attached to.
  # this introduces a frame in the matrix, but will be removed at the end.

  if(model == "norna"){
    out_pdb_file = read.pdb("~/mdruns/protein/protein_metad/box.pdb")
  }else if(model == "BAJ01"){
    out_pdb_file = read.pdb("~/mdruns/BAJ_01/box.pdb")
  }else {
    print("Unkown Model selected (Update the potential starting model list.")
    break
  }

  # creates the framenos property to match up particular frames to their relevant framenos
  # from the trajectory, allowing for matching up of other properties from the analysis.

  out_pdb_file$framenos = as.numeric()

  # process all of the trajectory slices
  for(i in 1:max(slices)){

    selected_frames = framenos[fils[i,]]

    # if there are no selected frames, skip reading in this trajectory slice.

    if(length(selected_frames > 0 )){

      ref_frames_file = readRDS(file = print(paste0(dir, "/", model, "_", i*10000, ".rds")))

      print(paste0("Extracting frames from slice ", i))
      print(paste0("Frames being extracted:"))
      print(selected_frames)

      ref_frames_file$xyz = ref_frames_file$xyz[relative_framenos[fils[i,]], ]

      ref_frames_file$framenos = selected_frames

      # assign(paste("pdb", i, sep = "_"), value = ref_frames_file, envir = .GlobalEnv)

      out_pdb_file$xyz = rbind(out_pdb_file$xyz, ref_frames_file$xyz)

      out_pdb_file$framenos = c(out_pdb_file$framenos, selected_frames)

    }else{

      print(paste0("No frames from slice ", i, " selected."))
    }
  }

  #remove the initial frame that is introduced when reading in the first structure
  # file before adding the trajectories to it.

  out_pdb_file$xyz = out_pdb_file$xyz[2:nrow(out_pdb_file$xyz),]

  # return the final file.
  return(out_pdb_file)

}
