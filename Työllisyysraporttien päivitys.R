
#Asetetaan työskentelykansio, vaihda oma
setwd("Z:/Työllisyydenhoito/Työllisyysraportit/Tyollisyys_hml")
#Päivitetään rajapinnoilta haettavat datat
source("Työllisyysdata.R")

#Ajetaan raportit ja asetetaan niille tallennuskansio
library(rmarkdown)
output_dir <- "../Raportit"
render("Työllisyysguru.Rmd", output_dir = output_dir, params = list(output_dir = output_dir))
render("Ketterimmät.Rmd", output_dir = output_dir, params = list(output_dir = output_dir))
