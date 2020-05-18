
#uses the return_xyz function to get xyz of two residues from a pdb object, then calculates the distance between them.
#This is done across all frames in the pdb object.

fretplot <- function(df,
                     linesize=0.7,
                     bin.width = 0.01,
                     frame_divisions = 100,
                     plot.title = "Calculated FRET",
                     my_colours= c("#264653", "#2A9D8F", "#E9C46A", "#F4A261", "#E76F51")
                     )
  {

  fp.1 <- ggplot(df, aes(frame/frame_divisions, FRET)) + geom_line(colour=my_colours[5], size=linesize) +
    coord_cartesian(ylim=c(0,1)) +
    theme_linedraw() +
    labs(x = "Time (ns)") +
    scale_x_continuous() +
    scale_y_continuous(breaks=seq(0,1,0.2)) +
    theme(aspect.ratio = 1/3,
          panel.grid.minor.x = element_blank(),
          # panel.grid = element_blank(),
          plot.margin = margin(t = 0, r = 0, b = 0, l = 0, unit = "pt"))


  fp.2 <- ggplot(df) +
    geom_histogram(aes(y = FRET), binwidth = bin.width) +
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
