ik_calc_average.gr <- function(data,start,end) {
        yeardiff <- as.numeric(gsub('y','',end))-as.numeric(gsub('y','',start))
        agr <- (data[,end]/data[,start])^(1/yeardiff)
        return(agr)
}
