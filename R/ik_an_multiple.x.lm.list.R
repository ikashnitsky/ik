################################################################################
#
# PhD. European convergence 02-03-2015
# Function. Run several simple lm models with various regressors (xi) and the same
# regressand (y)
# NOTE: the function designed for just a simple linear regression with 1 regressor;
# input is a data.farme; x and y are defined as numbers
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
################################################################################

ik_an_multiple.x.lm.list <- function(data, y, x, scaled=F, log.x=F){
        
        require(dplyr)

        models <- list()
        for (i in 1:length(x)){
                
                var.x <- unlist(select(data,x[i]))
                var.y <- unlist(select(data,y))

                if (scaled==F & log.x==F){modeli <- lm(var.y~var.x)} 
                else if (scaled==F & log.x==T){modeli <- lm(var.y~log(var.x))}
                else if (scaled==T & log.x==F) {modeli <- lm(scale(var.y)~scale(var.x))}
                else {modeli <- lm(scale(var.y)~scale(log(var.x)))}
                
                models[[i]] <- modeli
                names(models)[i] <- paste(names(data)[y],names(data)[x[i]],sep='.')
        }
        return(models)
}
