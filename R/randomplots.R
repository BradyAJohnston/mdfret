#' Random Plots
#'
#' Randomly generates ggplots using {shinyipsum} and adds them together
#' using \code{patchwork::wrap_plots()}.
#' @param x Number of plots to generate.
#' @export
random_plots <- function(x) {
  plots <- list()

  for (i in 1:x) {
    plots[[i]] <- shinipsum::random_ggplot()
  }

  patchwork::wrap_plots(plots, guides = "collect")

}
