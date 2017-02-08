################################################################################
#                                                                                                        
# PhD. Paper1. 20-07-2016
# Function - round a data frame
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#
# Source: http://jeromyanglim.tumblr.com/post/50228877196/round-numbers-in-data-frame-that-contains-non
#                                                                                                    
################################################################################

ik_ut_round.df <-  function(x, digits) {
        # round all numeric variables
        # x: data frame 
        # digits: number of digits to round
        numeric_columns <- sapply(x, class) == 'numeric'
        x[numeric_columns] <-  round(x[numeric_columns], digits)
        return(x)
}
