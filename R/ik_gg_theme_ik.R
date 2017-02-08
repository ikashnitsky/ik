################################################################################
#
# Custom theme for ggplot2. 03-10-2016
#
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################

# Inspired by: http://juliasilge.com/blog/Bayesian-Blues/
# Implementation SO: http://stackoverflow.com/a/27402150/4638884

require(extrafont)

theme_ik <- ggthemes::theme_few(base_size = 15, base_family = "Roboto Condensed") +

                theme(
                        panel.grid=element_line(colour = 'grey75',size=.25),
                        plot.title=element_text(family="Roboto-Bold")

                )


