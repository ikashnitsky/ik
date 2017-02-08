################################################################################
#
# PhD. Paper1. 03-08-2016
# Function - my own wrapper for ggsave function
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
# Source: http://jeromyanglim.tumblr.com/post/50228877196/round-numbers-in-data-frame-that-contains-non
#
################################################################################

ik_ggsave <- function(gg=ggplot2::last_plot(),path=c("temp.png"),w=12,ar=.5625,h=w*ar,dpi=192) {
        require(ggplot2)
        ggplot2::ggsave(filename=path,plot=gg,width=w,height=h,dpi=dpi,type="cairo-png")
}
