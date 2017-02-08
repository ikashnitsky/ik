################################################################################
#                                                                                                        
# PhD. Paper1. 30-05-2016
# Function - rate of convergence
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#                                                                                                    
################################################################################

ik_phd_rate.of.convergence <- function(model,t=10) {
        beta <- unname(-log(coef(model)[2]*t+1)/t)
        return(beta)
}