################################################################################
#                                                                                                        
# PhD. Paper1. 20-07-2016
# Function - plot the regression formula
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
# Source: http://stackoverflow.com/a/13451587/4638884
#                                                                                                    
################################################################################

ik_gg_regression.formula <- function(m) {
        
        l <- list(a = format(coef(m)[1], digits = 2),
                  b = format(abs(coef(m)[2]), digits = 2),
                  r2 = format(summary(m)$r.squared, digits = 3));
        
        if (coef(m)[2] >= 0)  {
                eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2,l)
        } else {
                eq <- substitute(italic(y) == a - b %.% italic(x)*","~~italic(r)^2~"="~r2,l)    
        }
        
        as.character(as.expression(eq));                 
}