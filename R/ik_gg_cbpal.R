ik_gg_cbpal <- function(n=8, colors=NULL){
        cbpal <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
        if(!is.null(colors)){cbpal <- cbpal[colors]}
        out <- c()
        for(i in 1:n){
                colnum <- i%%length(cbpal)
                if(colnum==0){colnum <- length(cbpal)}
                out[i] <- cbpal[colnum]
        }
        
        return(out)
}