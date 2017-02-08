ik_calc_variance.explained <- function(model){
        af <- summary(aov(model))
        afss <- af[[1]][["Sum Sq"]]
        print(cbind(af[[1]],PctExp=afss/sum(afss)*100))
}
