## This will form the basis of my R package


# Returns the xyx of a particular residue, at a particular frame of a .pdb object
# that contains multiple frames.

return_xyz <- function(some_pdb, some_residue, some_frame){
  selec.xyz <- atom.select.pdb(some_pdb, string="calpha", resno = some_residue)$xyz
  some_pdb$xyz[some_frame, selec.xyz]
}


#uses the return_xyz function to get xyz of two residues from a pdb object, then calculates the distance between them.
#This is done across all frames in the pdb object.

distance_residues <- function(some_pdb, res1, res2){

  #creating dataframe to write to
  results_frame = data.frame(
    frame = 0,
    distance = 0)

  #getting how many frames in pdb

  no_frames = dim(some_pdb$xyz)[1]

  print(paste("There are", no_frames, "frames in this file."))

  #going through each frame, getting distance between
  #the specified residue calphas

  for (i in 1:no_frames){

    results_frame[i,] <- c(no_frames-i, as.numeric(return_xyz(some_pdb, res1, i),
                                                   return_xyz(some_pdb, res2, i)))
  }

  return(results_frame)

}


## Calculate and add column of FRET values from distnace and R0 values
## Default R0 value

fretcalc <- function(df, R0 = 52){

df$FRET <- 1 / (1 + (df$distance / R0)^6)

head(dis.df)

return(df)
}


fretplot <- function(df, linesize=0.7, bin.width = 0.01, plot.title = "Calculated FRET"){

  fp.1 <- ggplot(dis.df, aes(frame/100, FRET)) + geom_line(colour=my_colours[5], size=linesize) +
    coord_cartesian(ylim=c(0,1)) +
    theme_linedraw() +
    labs(x = "Time (ns)") +
    scale_x_continuous(breaks = seq(0,10,1)) +
    scale_y_continuous(breaks=seq(0,1,0.2)) +
    theme(aspect.ratio = 1/3,
          panel.grid.minor.x = element_blank(),
          # panel.grid = element_blank(),
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "pt"))


  fp.2 <- ggplot(dis.df) + geom_histogram(aes(y = FRET), binwidth = bin.width) +
    coord_cartesian(ylim=c(0,1)) +
    theme_linedraw() +
    labs(x="Count") +
    scale_y_continuous(breaks = seq(0,1,0.2)) +
    theme(aspect.ratio = 2,
          # panel.grid = element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          axis.line.y.right = element_blank(),
          axis.line.x.top = element_blank(),
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "pt"),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title.y = element_blank())

  (fp.1) + (fp.2) +
    plot_annotation(title = plot.title, caption = "Distances from MD simulations used to calculate theoretical FRET values.")
}

#Takes a file path and open sthe COLVAR_ABMD file, to plot relevant data from the run.
#for alpha plotting the data needs to be transformed via alpha/(resno-6) to put it onto a 0-1 scale.
#Returns the patchwork object of the assembled final plot
# can change the colours of the plot by using the my_colours argument to input different palette

timetoplot <- function(some_file,
                       resno=610,
                       some_title = "Data from MD run",
                       my_colours= c("#264653", "#2A9D8F", "#E9C46A", "#F4A261", "#E76F51")){
  rmsd <- read.table(some_file)

  colnames(rmsd) <- c("time", "rmsd0", "rmsd1", "alpha","total.bias", "total.rmsd0_min")

  m.rmsd <- melt(rmsd, id.vars = c("time", "total.bias", "total.rmsd0_min", "alpha"))

  head(m.rmsd)

  baseplot <- ggplot(m.rmsd, aes(x=time)) +
    theme_linedraw()  +
    theme(aspect.ratio = 1/6,
          axis.text.x.bottom = element_blank(),
          axis.title.x = element_blank(),
          axis.ticks.x = element_blank(),
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "pt"),
          axis.title.y.left = element_text(vjust = 1, ))

  p1 <- baseplot +
    geom_line(aes(y = value, colour=variable),
              size = linesize) +
    labs(x = "Time (ns)", y = "RMSD Value", colour="Model") +
    scale_colour_manual(values = my_colours[1:2])

  p2 <- baseplot +
    geom_line(aes(y = total.bias),
              colour=my_colours[3],
              size = linesize,
              alpha=0.7) +
    labs(y = "Total Bias")

  palpha <- baseplot +
    geom_line(aes(y = alpha/(resno-6)),
              colour=my_colours[4],
              size = linesize,
              alpha=0.7) +
    coord_cartesian(ylim = c(0,1)) +
    labs(y = "Alpha")

  p3 <-baseplot +
    geom_line(aes(y = total.rmsd0_min),
              colour=my_colours[5],
              size = linesize) +
    labs(x = "Time (ns)", y = "RMSD0_min") +
    theme(axis.ticks.x = element_line(),
          axis.text.x.bottom = element_text(),
          axis.title.x = element_text())



  (p1 / p2 /  palpha / p3) + plot_annotation(title = some_title)

}

