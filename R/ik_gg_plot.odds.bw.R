ik_gg_plot.odds.bw <- function(df_plot_odds, xlab="Odds Ratio", ylab="", asp=1){
    require(ggplot2)
    p <- ggplot(df_plot_odds, aes(x=vars, y=OR, ymin=lower, ymax=upper),asp=asp) +
        geom_errorbar(aes(color=col),width=0.1) +
        geom_point(aes(color=col),size=3)+
        geom_hline(yintercept = 1, linetype=2) +
        scale_color_manual('Effect', labels=c('Positive','Negative'),
                          values=c('blue','red'))+
        coord_flip() +
        #expand_limits(y = 0)+
        #
        theme_bw()+
        theme(legend.position="none",aspect.ratio = asp)+
        ylab(xlab) +
        xlab(ylab) #switch because of the coord_flip() above
    return(p)
}
