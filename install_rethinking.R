## Install the experimental version of Richard McElreath's rethinking package
#
install.packages(c("coda","mvtnorm","devtools"))

library(devtools)

devtools::install_github("rmcelreath/rethinking",ref="Experimental")