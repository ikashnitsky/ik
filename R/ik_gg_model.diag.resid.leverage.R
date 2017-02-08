ik_gg_model.diag.resid.leverage <-function(model){
        
        require(ggplot2)
        
        plot <- ggplot(model, aes(.hat, .stdresid))+
                geom_point(aes(size=.cooksd), na.rm=TRUE)+
                stat_smooth(method="loess", na.rm=TRUE)+
                xlab("Leverage")+
                ylab("Standardized Residuals")+
                ggtitle("Residual vs Leverage Plot")+
                scale_size_continuous("Cook's Distance", range=c(1,5))+
                theme_bw(base_size = 12)+
                theme(aspect.ratio=.7,
                      legend.position="bottom")
        
        return(plot)
}