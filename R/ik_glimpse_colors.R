################################################################################
#
# PhD. Paper1. 29-08-2016
# Function - glance colors
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################

ik_glimpse_colors <- function(colors_string){
        n <- length(colors_string)
        hist(1:n,breaks=0:n,col=colors_string)
}
