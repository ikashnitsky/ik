ik_calc_df.plot.odds <- function(x){
    tmp<-data.frame(cbind(exp(coef(x)), exp(confint.default(x))))
    odds<-tmp[-1,]
    names(odds)<-c('OR', 'lower', 'upper')
    odds$vars<-row.names(odds)
    odds$col<-odds$OR>1
    odds$col[odds$col==TRUE] <-'blue'
    odds$col[odds$col==FALSE] <-'red'
    odds$pvalue <- summary(x)$coef[-1, "Pr(>|z|)"]
    return(odds)
}
