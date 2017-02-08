################################################################################
#
# PhD. Paper1. 18-08-2016
# Function - my own wrapper for ggsave function to save using Cairo
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################


ik_explot_pdf <- function(gg=ggplot2::last_plot(),path=c("temp.pdf"),w=12,ar=.5625,h=w*ar,
                          onefile = FALSE, family = "sans", bg = "white",
                          antialias = c("default", "none", "gray", "subpixel"),
                          fallback_resolution = 300){
        require(ggplot2)
        cairo_pdf(filename=path,width=w,height=h,
                  onefile = onefile, family = family, bg = bg,
                  antialias = antialias,
                  fallback_resolution = fallback_resolution)
        print(gg)
        dev.off()
}


ik_explot_png <- function(gg=ggplot2::last_plot(),path=c("temp.png"),w=12,ar=.5625,h=w*ar,dpi=300) {
        require(ggplot2)
        ggplot2::ggsave(filename=path,plot=gg,width=w,height=h,dpi=dpi,type="cairo-png")
}
