options(repos = c(CRAN = "https://cran.rstudio.com/"))

pkgs <- c("tidyverse", "ggraph", "fivethirtyeight", "ggiraph",
          "magick", "ggthemes", "ggrepel", "ggtext", 
          "moderndive", "pacman", "devtools",
          "remotes")

install.packages(pkgs)

remotes::install_git("https://codeberg.org/hrbrmstr/hrbrthemes.git")
remotes::install_github("jbkunst/highcharter")

rm(pkgs)
