ik_gg_model.diag.fit.resid <-function(model){

        require(ggplot2)

        plot <- ggplot(model, aes(.fitted, .resid))+
                geom_point()+
                stat_smooth(method="loess")+
                geom_hline(yintercept=0, col="red", linetype="dashed")+
                xlab("Fitted values")+
                ylab("Residuals")+
                ggtitle("Residual vs Fitted Plot")+
                theme_bw(base_size = 12)+
                theme(aspect.ratio=1)

        return(plot)
}
