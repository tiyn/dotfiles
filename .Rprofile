if (!interactive()) {
  options(device = function(...) pdf("Rplot.pdf"))

  .Last <- function() {
    if (dev.cur() > 1) {
      dev.off()
      system("xdg-open Rplot.pdf", wait = FALSE)
      Sys.sleep(2)
    }
  }
}
